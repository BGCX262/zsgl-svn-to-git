package com.zsgl.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.Version;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
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

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn
@Configurable
@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findHotelsByAddress", "findHotelsByNameLike",
		"findHotelsByHotelLevel" }, inheritanceType = "SINGLE_TABLE")
public class Hotel {

	@Size(min = 1)
	private String name;

	@ManyToOne
	private HotelAddress address;

	@ManyToOne
	private HotelLevel hotelLevel;

	@Size(min = 1)
	private String image;

	private String location;

	private String attractons;

	private String openingTime;

	private String floor;

	private String num;

	@Size(max = 50000)
	private String remark;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "hotel")
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	@OrderBy
	private Set<Room> rooms = new HashSet<Room>();

	@NotNull
	@Min(1L)
	private Integer sort;

	@ManyToOne
	private Recommend recommend;
	
	private String keywords;
	
	private String description;

	public com.zsgl.domain.Hotel prev() {
		Hotel hotel = null;
		try {
			TypedQuery<Hotel> query = entityManager().createQuery(
					"from Hotel where id < :id order by id desc", Hotel.class);
			query.setParameter("id", this.getId());
			query.setFirstResult(0).setMaxResults(1);
			hotel = query.getSingleResult();
		} catch (Exception e) {
		}
		return hotel;
	}

	public com.zsgl.domain.Hotel next() {
		Hotel hotel = null;
		try {
			TypedQuery<Hotel> query = entityManager().createQuery(
					"from Hotel where id > :id order by id", Hotel.class);
			query.setParameter("id", this.getId());
			query.setFirstResult(0).setMaxResults(1);
			hotel = query.getSingleResult();
		} catch (Exception e) {
		}
		return hotel;
	}

	public static List<com.zsgl.domain.Hotel> getSortHotels(int first,
			int maxResult) {
		List<Hotel> list = null;
		try {
			TypedQuery<Hotel> query = entityManager().createQuery(
					"from Hotel order by sort asc", Hotel.class);
			query.setFirstResult(first).setMaxResults(maxResult);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<com.zsgl.domain.Hotel> getSortHotelsByAddress(
			HotelAddress address, int first, int maxResult) {
		List<Hotel> hotels = null;
		try {
			TypedQuery<Hotel> query = entityManager().createQuery(
					"from Hotel where address = :address order by sort asc",
					Hotel.class);
			query.setParameter("address", address);
			query.setFirstResult(first).setMaxResults(maxResult);
			hotels = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hotels;
	}

	public static List<com.zsgl.domain.Hotel> getSortHotelsByLevel(
			HotelLevel level, int first, int maxResult) {
		List<Hotel> list = null;
		try {
			TypedQuery<Hotel> query = entityManager().createQuery(
					"from Hotel where hotelLevel = :level order by sort asc",
					Hotel.class);
			query.setParameter("level", level);
			query.setFirstResult(first).setMaxResults(maxResult);
			list = query.getResultList();
		} catch (Exception e) {
		}
		return list;
	}
	
	public static int countSearch(HotelAddress address, HotelLevel level,
			String content) {
		int count = 0;
		try {
			CriteriaBuilder cb = entityManager().getCriteriaBuilder();
			CriteriaQuery<Hotel> cq = cb.createQuery(Hotel.class);
			Root<Hotel> root = cq.from(Hotel.class);
			Predicate p = cb.and(cb.like(root.<String> get("name"), "%"
					+ content + "%"));
			if (address != null) {
				p.getExpressions().add(
						cb.and(cb.equal(root.get("address"), address)));
			}
			if (level != null) {
				p.getExpressions().add(
						cb.and(cb.equal(root.get("hotelLevel"), level)));
			}
			cq.orderBy(cb.asc(root.get("sort")));
			cq.where(p);
			count = entityManager().createQuery(cq)
					.getResultList().size();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public static List<Hotel> search(HotelAddress address, HotelLevel level,
			String content, int first, int maxResult) {
		List<Hotel> list = null;
		try {
			CriteriaBuilder cb = entityManager().getCriteriaBuilder();
			CriteriaQuery<Hotel> cq = cb.createQuery(Hotel.class);
			Root<Hotel> root = cq.from(Hotel.class);
			Predicate p = cb.and(cb.like(root.<String> get("name"), "%"
					+ content + "%"));
			if (address != null) {
				p.getExpressions().add(
						cb.and(cb.equal(root.get("address"), address)));
			}
			if (level != null) {
				p.getExpressions().add(
						cb.and(cb.equal(root.get("hotelLevel"), level)));
			}
			cq.orderBy(cb.asc(root.get("sort")));
			cq.where(p);
			list = entityManager().createQuery(cq)
					.setFirstResult(first).setMaxResults(maxResult)
					.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

	public static List<Hotel> findByRecommend(int first, int maxResult) {
		List<Hotel> list = null;
		try {
			TypedQuery<Hotel> query = entityManager()
					.createQuery(
							"from Hotel where recommend = :recommend order by sort desc",
							Hotel.class);
			query.setParameter("recommend", Recommend.findRecommend(2L));
			query.setFirstResult(first).setMaxResults(maxResult);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 查询酒店指定时间段内的房间价格
	 * 
	 * @param begin
	 * @param end
	 * @return
	 */
	public List<Room> findRooms(Date begin, Date end) {
		List<Room> list = new ArrayList<Room>();
		try {
			Set<Price> prices = new HashSet<Price>(Price
					.findPricesByDateBetween(begin, end).getResultList());
			List<Room> rooms = Room.findRoomsByPrices(prices).getResultList();
			for (Room r : rooms) {
				if (this.rooms.contains(r)) {
					list.add(r);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Price> queryPrice(Date begin, Date end) {

		/* 该时间段内的价格 */
		TypedQuery<Price> pq = entityManager.createQuery(
				"SELECT o FROM Price o WHERE o.date BETWEEN :begin AND :end",
				Price.class);
		pq.setParameter("begin", begin).setParameter("end", end);
		List<Price> prices = pq.getResultList();
		/* 过滤后的价格 */
		List<Price> ps = new ArrayList<Price>();
		for (Price p : prices) {
			for (Room r : this.getRooms()) {
				if (r.getPrices().contains(p)) {
					ps.add(p);
					break;
				}
			}
		}
		return ps;
	}

	/**
	 * 将目标对象的属性拷贝到自身 只拷贝基本数据类型，不包含应用类型
	 * 
	 * @param other
	 */
	public void copy(Hotel other) {
		this.address = other.address;
		this.attractons = other.attractons;
		this.floor = other.floor;
		this.image = other.image;
		this.hotelLevel = other.hotelLevel;
		this.location = other.location;
		this.name = other.name;
		this.num = other.num;
		this.openingTime = other.openingTime;
		this.recommend = other.recommend;
		this.remark = other.remark;
		this.sort = other.sort;
		this.keywords = other.keywords;
		this.description = other.description;
	}


	public static TypedQuery<Hotel> findHotelsByAddress(HotelAddress address) {
        if (address == null) throw new IllegalArgumentException("The address argument is required");
        EntityManager em = Hotel.entityManager();
        TypedQuery<Hotel> q = em.createQuery("SELECT o FROM Hotel AS o WHERE o.address = :address", Hotel.class);
        q.setParameter("address", address);
        return q;
    }

	public static TypedQuery<Hotel> findHotelsByHotelLevel(HotelLevel hotelLevel) {
        if (hotelLevel == null) throw new IllegalArgumentException("The hotelLevel argument is required");
        EntityManager em = Hotel.entityManager();
        TypedQuery<Hotel> q = em.createQuery("SELECT o FROM Hotel AS o WHERE o.hotelLevel = :hotelLevel", Hotel.class);
        q.setParameter("hotelLevel", hotelLevel);
        return q;
    }

	public static TypedQuery<Hotel> findHotelsByNameLike(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        name = name.replace('*', '%');
        if (name.charAt(0) != '%') {
            name = "%" + name;
        }
        if (name.charAt(name.length() - 1) != '%') {
            name = name + "%";
        }
        EntityManager em = Hotel.entityManager();
        TypedQuery<Hotel> q = em.createQuery("SELECT o FROM Hotel AS o WHERE LOWER(o.name) LIKE LOWER(:name)", Hotel.class);
        q.setParameter("name", name);
        return q;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new Hotel().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countHotels() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Hotel o", Long.class).getSingleResult();
    }

	public static List<Hotel> findAllHotels() {
        return entityManager().createQuery("SELECT o FROM Hotel o", Hotel.class).getResultList();
    }

	public static Hotel findHotel(Long id) {
        if (id == null) return null;
        return entityManager().find(Hotel.class, id);
    }

	public static List<Hotel> findHotelEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Hotel o", Hotel.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            Hotel attached = Hotel.findHotel(this.id);
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
    public Hotel merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Hotel merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public HotelAddress getAddress() {
        return this.address;
    }

	public void setAddress(HotelAddress address) {
        this.address = address;
    }

	public HotelLevel getHotelLevel() {
        return this.hotelLevel;
    }

	public void setHotelLevel(HotelLevel hotelLevel) {
        this.hotelLevel = hotelLevel;
    }

	public String getImage() {
        return this.image;
    }

	public void setImage(String image) {
        this.image = image;
    }

	public String getLocation() {
        return this.location;
    }

	public void setLocation(String location) {
        this.location = location;
    }

	public String getAttractons() {
        return this.attractons;
    }

	public void setAttractons(String attractons) {
        this.attractons = attractons;
    }

	public String getOpeningTime() {
        return this.openingTime;
    }

	public void setOpeningTime(String openingTime) {
        this.openingTime = openingTime;
    }

	public String getFloor() {
        return this.floor;
    }

	public void setFloor(String floor) {
        this.floor = floor;
    }

	public String getNum() {
        return this.num;
    }

	public void setNum(String num) {
        this.num = num;
    }

	public String getRemark() {
        return this.remark;
    }

	public void setRemark(String remark) {
        this.remark = remark;
    }

	public Set<Room> getRooms() {
        return this.rooms;
    }

	public void setRooms(Set<Room> rooms) {
        this.rooms = rooms;
    }

	public Integer getSort() {
        return this.sort;
    }

	public void setSort(Integer sort) {
        this.sort = sort;
    }

	public Recommend getRecommend() {
        return this.recommend;
    }

	public void setRecommend(Recommend recommend) {
        this.recommend = recommend;
    }

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

	@Version
    @Column(name = "version")
    private Integer version;

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

	public String getKeywords() {
        return this.keywords;
    }

	public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

	public String getDescription() {
        return this.description;
    }

	public void setDescription(String description) {
        this.description = description;
    }
}
