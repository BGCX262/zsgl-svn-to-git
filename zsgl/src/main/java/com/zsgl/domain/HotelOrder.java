package com.zsgl.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn
@Configurable
@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "SINGLE_TABLE", finders = { "findHotelOrdersByNameLike", "findHotelOrdersByEnterDateLessThan", "findHotelOrdersByLeaveDateGreaterThan" })
public class HotelOrder extends BaseOrder {
	
	/**
	 * 酒店名称
	 */
    private String name;
    
    /**
     * 入住时间
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date enterDate;
    
    /**
     * 离开时间
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date leaveDate;
    
    /**
     * 房间数量
     */
    private Integer num;
    
    /**
     * 房间
     */
    @ManyToOne
    private Room room;
    
    /**
     * 天数
     */
    private int days;

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public static long countHotelOrders() {
        return entityManager().createQuery("SELECT COUNT(o) FROM HotelOrder o", Long.class).getSingleResult();
    }

	public static List<HotelOrder> findAllHotelOrders() {
        return entityManager().createQuery("SELECT o FROM HotelOrder o", HotelOrder.class).getResultList();
    }

	public static HotelOrder findHotelOrder(Long id) {
        if (id == null) return null;
        return entityManager().find(HotelOrder.class, id);
    }

	public static List<HotelOrder> findHotelOrderEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM HotelOrder o", HotelOrder.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	@Transactional
    public HotelOrder merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        HotelOrder merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public static TypedQuery<HotelOrder> findHotelOrdersByEnterDateLessThan(Date enterDate) {
        if (enterDate == null) throw new IllegalArgumentException("The enterDate argument is required");
        EntityManager em = HotelOrder.entityManager();
        TypedQuery<HotelOrder> q = em.createQuery("SELECT o FROM HotelOrder AS o WHERE o.enterDate < :enterDate", HotelOrder.class);
        q.setParameter("enterDate", enterDate);
        return q;
    }

	public static TypedQuery<HotelOrder> findHotelOrdersByLeaveDateGreaterThan(Date leaveDate) {
        if (leaveDate == null) throw new IllegalArgumentException("The leaveDate argument is required");
        EntityManager em = HotelOrder.entityManager();
        TypedQuery<HotelOrder> q = em.createQuery("SELECT o FROM HotelOrder AS o WHERE o.leaveDate > :leaveDate", HotelOrder.class);
        q.setParameter("leaveDate", leaveDate);
        return q;
    }

	public static TypedQuery<HotelOrder> findHotelOrdersByNameLike(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        name = name.replace('*', '%');
        if (name.charAt(0) != '%') {
            name = "%" + name;
        }
        if (name.charAt(name.length() - 1) != '%') {
            name = name + "%";
        }
        EntityManager em = HotelOrder.entityManager();
        TypedQuery<HotelOrder> q = em.createQuery("SELECT o FROM HotelOrder AS o WHERE LOWER(o.name) LIKE LOWER(:name)", HotelOrder.class);
        q.setParameter("name", name);
        return q;
    }

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public Date getEnterDate() {
        return this.enterDate;
    }

	public void setEnterDate(Date enterDate) {
        this.enterDate = enterDate;
    }

	public Date getLeaveDate() {
        return this.leaveDate;
    }

	public void setLeaveDate(Date leaveDate) {
        this.leaveDate = leaveDate;
    }

	public Integer getNum() {
        return this.num;
    }

	public void setNum(Integer num) {
        this.num = num;
    }

	public Room getRoom() {
        return this.room;
    }

	public void setRoom(Room room) {
        this.room = room;
    }
	
	public int getDays() {
		if(days == 0) return 0;
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}
}
