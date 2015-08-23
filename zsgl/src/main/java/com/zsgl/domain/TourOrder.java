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

@Configurable
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn
@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "SINGLE_TABLE", finders = { "findTourOrdersByNameLike", "findTourOrdersByGroupDateLessThan", "findTourOrdersByGroupDateGreaterThan" })
public class TourOrder extends BaseOrder {
	
	/**
	 * 路线名称
	 */
    private String name;
    
    /**
     * 出发日期
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date groupDate;
    
    /**
     * 成人个数
     */
    private Integer num;
    
    /**
     * 儿童个数
     */
    private Integer children;
    
    @ManyToOne
    private Tour tour;

	public static TypedQuery<TourOrder> findTourOrdersByGroupDateGreaterThan(Date groupDate) {
        if (groupDate == null) throw new IllegalArgumentException("The groupDate argument is required");
        EntityManager em = TourOrder.entityManager();
        TypedQuery<TourOrder> q = em.createQuery("SELECT o FROM TourOrder AS o WHERE o.groupDate > :groupDate", TourOrder.class);
        q.setParameter("groupDate", groupDate);
        return q;
    }

	public static TypedQuery<TourOrder> findTourOrdersByGroupDateLessThan(Date groupDate) {
        if (groupDate == null) throw new IllegalArgumentException("The groupDate argument is required");
        EntityManager em = TourOrder.entityManager();
        TypedQuery<TourOrder> q = em.createQuery("SELECT o FROM TourOrder AS o WHERE o.groupDate < :groupDate", TourOrder.class);
        q.setParameter("groupDate", groupDate);
        return q;
    }

	public static TypedQuery<TourOrder> findTourOrdersByNameLike(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        name = name.replace('*', '%');
        if (name.charAt(0) != '%') {
            name = "%" + name;
        }
        if (name.charAt(name.length() - 1) != '%') {
            name = name + "%";
        }
        EntityManager em = TourOrder.entityManager();
        TypedQuery<TourOrder> q = em.createQuery("SELECT o FROM TourOrder AS o WHERE LOWER(o.name) LIKE LOWER(:name)", TourOrder.class);
        q.setParameter("name", name);
        return q;
    }

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public Date getGroupDate() {
        return this.groupDate;
    }

	public void setGroupDate(Date groupDate) {
        this.groupDate = groupDate;
    }

	public Integer getNum() {
        return this.num;
    }

	public void setNum(Integer num) {
        this.num = num;
    }

	public Integer getChildren() {
        return this.children;
    }

	public void setChildren(Integer children) {
        this.children = children;
    }
	
	public Tour getTour() {
		return tour;
	}

	public void setTour(Tour tour) {
		this.tour = tour;
	}

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public static long countTourOrders() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TourOrder o", Long.class).getSingleResult();
    }

	public static List<TourOrder> findAllTourOrders() {
        return entityManager().createQuery("SELECT o FROM TourOrder o", TourOrder.class).getResultList();
    }

	public static TourOrder findTourOrder(Long id) {
        if (id == null) return null;
        return entityManager().find(TourOrder.class, id);
    }

	public static List<TourOrder> findTourOrderEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TourOrder o", TourOrder.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	@Transactional
    public TourOrder merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TourOrder merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
}
