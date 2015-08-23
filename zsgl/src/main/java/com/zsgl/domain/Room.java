package com.zsgl.domain;

import java.text.ParseException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.Version;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

import com.zsgl.util.Common;

/**
 * 酒店房间
 * @author itachi
 *
 */
@Configurable
@Entity
@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findRoomsByRoomState", "findRoomsByDoorPriceLessThan", "findRoomsByDoorPriceGreaterThan", "findRoomsByDoorPriceBetween", "findRoomsByPrices" })
public class Room {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

	@Version
    @Column(name = "version")
    private Integer version;
	/**
	 * 房型名称
	 */
    @Size(min = 1)
    private String name;
    
    /**
     * 门票价
     */
    private Float doorPrice;
    
    /**
     * 房间状态
     */
    @ManyToOne
    private RoomState roomState;
    
    /**
     * 类型
     */
    private String type;
    
    /**
     * 床型
     */
    private String bad;
    
    /**
     * 面积
     */
    private String area;
    
    /**
     * 楼层
     */
    private String floor;
    
    /**
     * 宽带
     */
    private String net;
    
    /**
     * 早餐
     */
    private String breakfast;
    
    /**
     * 优惠价，已废弃
     */
    private Float privilege;
    
    /**
     * 房间价格，每天的价格都不相同
     * 所以需要定义一个集合来存储每天的价格
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "room")
    @OrderBy("date")
    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    private Set<Price> prices = new HashSet<Price>();
    
    /**
     * 酒店
     */
    @ManyToOne
    @JoinColumn(name = "hotel_id")
    private Hotel hotel;

    public void copy(com.zsgl.domain.Room room) {
        this.area = room.area;
        this.bad = room.bad;
        this.breakfast = room.breakfast;
        this.doorPrice = room.doorPrice;
        this.floor = room.floor;
        this.name = room.name;
        this.net = room.net;
        this.roomState = room.roomState;
        this.type = room.type;
    }
    
    /**
     * 获取当天的价格
     * 如果没有设置
     * 则返回null
     * @return
     */
    public Float getTodayPrice() {
    	TypedQuery<Float> q = entityManager().createQuery("SELECT o.price FROM Price AS o WHERE o.room = :room AND o.date = :date", Float.class);
    	try {
			q.setParameter("room", this).setParameter("date", Common.simpleDateFormat.parse(Common.simpleDateFormat.format(new Date(System.currentTimeMillis()))));
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	if (q.getResultList().isEmpty()) {
    		return null;
    	}
    	return q.getSingleResult();
	}

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public static TypedQuery<Room> findRoomsByDoorPriceBetween(Float minDoorPrice, Float maxDoorPrice) {
        if (minDoorPrice == null) throw new IllegalArgumentException("The minDoorPrice argument is required");
        if (maxDoorPrice == null) throw new IllegalArgumentException("The maxDoorPrice argument is required");
        EntityManager em = Room.entityManager();
        TypedQuery<Room> q = em.createQuery("SELECT o FROM Room AS o WHERE o.doorPrice BETWEEN :minDoorPrice AND :maxDoorPrice", Room.class);
        q.setParameter("minDoorPrice", minDoorPrice);
        q.setParameter("maxDoorPrice", maxDoorPrice);
        return q;
    }

	public static TypedQuery<Room> findRoomsByDoorPriceGreaterThan(Float doorPrice) {
        if (doorPrice == null) throw new IllegalArgumentException("The doorPrice argument is required");
        EntityManager em = Room.entityManager();
        TypedQuery<Room> q = em.createQuery("SELECT o FROM Room AS o WHERE o.doorPrice > :doorPrice", Room.class);
        q.setParameter("doorPrice", doorPrice);
        return q;
    }

	public static TypedQuery<Room> findRoomsByDoorPriceLessThan(Float doorPrice) {
        if (doorPrice == null) throw new IllegalArgumentException("The doorPrice argument is required");
        EntityManager em = Room.entityManager();
        TypedQuery<Room> q = em.createQuery("SELECT o FROM Room AS o WHERE o.doorPrice < :doorPrice", Room.class);
        q.setParameter("doorPrice", doorPrice);
        return q;
    }

	public static TypedQuery<Room> findRoomsByPrices(Set<Price> prices) {
        if (prices == null) throw new IllegalArgumentException("The prices argument is required");
        EntityManager em = Room.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Room AS o WHERE");
        for (int i = 0; i < prices.size(); i++) {
            if (i > 0) queryBuilder.append(" AND");
            queryBuilder.append(" :prices_item").append(i).append(" MEMBER OF o.prices");
        }
        TypedQuery<Room> q = em.createQuery(queryBuilder.toString(), Room.class);
        int pricesIndex = 0;
        for (Price _price: prices) {
            q.setParameter("prices_item" + pricesIndex++, _price);
        }
        return q;
    }

	public static TypedQuery<Room> findRoomsByRoomState(RoomState roomState) {
        if (roomState == null) throw new IllegalArgumentException("The roomState argument is required");
        EntityManager em = Room.entityManager();
        TypedQuery<Room> q = em.createQuery("SELECT o FROM Room AS o WHERE o.roomState = :roomState", Room.class);
        q.setParameter("roomState", roomState);
        return q;
    }
	
	public Long getId() {
        return this.id;
    }

	public void setId(Long id) {
        this.id = id;
    }

	public Integer getVersion() {
        return this.version;
    }

	public void setVersion(Integer version) {
        this.version = version;
    }
	
	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public Float getDoorPrice() {
        return this.doorPrice;
    }

	public void setDoorPrice(Float doorPrice) {
        this.doorPrice = doorPrice;
    }

	public RoomState getRoomState() {
        return this.roomState;
    }

	public void setRoomState(RoomState roomState) {
        this.roomState = roomState;
    }

	public String getType() {
        return this.type;
    }

	public void setType(String type) {
        this.type = type;
    }

	public String getBad() {
        return this.bad;
    }

	public void setBad(String bad) {
        this.bad = bad;
    }

	public String getArea() {
        return this.area;
    }

	public void setArea(String area) {
        this.area = area;
    }

	public String getFloor() {
        return this.floor;
    }

	public void setFloor(String floor) {
        this.floor = floor;
    }

	public String getNet() {
        return this.net;
    }

	public void setNet(String net) {
        this.net = net;
    }

	public String getBreakfast() {
        return this.breakfast;
    }

	public void setBreakfast(String breakfast) {
        this.breakfast = breakfast;
    }

	public Float getPrivilege() {
        return this.privilege;
    }

	public void setPrivilege(Float privilege) {
        this.privilege = privilege;
    }

	public Set<Price> getPrices() {
        return this.prices;
    }

	public void setPrices(Set<Price> prices) {
        this.prices = prices;
    }

	public Hotel getHotel() {
        return this.hotel;
    }

	public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new Room().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countRooms() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Room o", Long.class).getSingleResult();
    }

	public static List<Room> findAllRooms() {
        return entityManager().createQuery("SELECT o FROM Room o", Room.class).getResultList();
    }

	public static Room findRoom(Long id) {
        if (id == null) return null;
        return entityManager().find(Room.class, id);
    }

	public static List<Room> findRoomEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Room o", Room.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	@Transactional
    public void persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }

	@Transactional
    public void remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Room attached = Room.findRoom(this.id);
            this.entityManager.remove(attached);
        }
    }

	@Transactional
    public void flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }

	@Transactional
    public void clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }

	@Transactional
    public Room merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Room merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
}
