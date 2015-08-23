package com.zsgl.domain;

import java.util.List;

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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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

@Configurable
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn
@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "SINGLE_TABLE", finders = {
		"findToursByNameLike", "findToursByTourDay", "findToursByType",
		"findToursByAddress" })
@NamedQueries({
		@NamedQuery(name = "getSortTourByType", query = "from Tour where type = :type order by sort asc"),
		@NamedQuery(name = "getSortTour", query = "from Tour where type.id <> 14 order by sort asc") })
public class Tour {

	@Size(min = 1)
	private String name;

	private Float doorPrice;

	private Float privilege;

	private Float children;
	
	private String keywords;
	
	private String description;

	@ManyToOne
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private TourAddress address;

	@ManyToOne
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private TourType type;

	@ManyToOne
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private TourDay tourDay;

	@Size(min = 1)
	private String image;

	@Size(min = 1)
	private String startCity;

	@Size(min = 1)
	private String groupDate;

	@Size(min = 1)
	private String way;

	@Size(max = 50000)
	private String feature;

	@Size(max = 50000)
	private String plan;

	@NotNull
	@Min(1L)
	private Integer sort;

	@ManyToOne
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Recommend recommend;

	public static List<Tour> getSortTour(int first, int maxResult) {
		List<Tour> list = null;
		try {
			TypedQuery<Tour> query = entityManager().createNamedQuery(
					"getSortTour", Tour.class);
			query.setFirstResult(first).setMaxResults(maxResult);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Tour> getSortTourByType(TourType type, int first,
			int maxResult) {
		List<Tour> list = null;
		try {
			TypedQuery<Tour> query = entityManager().createNamedQuery(
					"getSortTourByType", Tour.class);
			query.setParameter("type", type);
			query.setFirstResult(first).setMaxResults(maxResult);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static <T> List<T> getSortEntities(int first, int maxResult,
			Class<T> clazz) {
		List<T> list = null;
		try {
			String sql = "from " + clazz.getName() + " order by id desc";
			TypedQuery<T> query = entityManager().createQuery(sql, clazz);
			query.setFirstResult(first).setMaxResults(maxResult);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static <T> List<T> getSortEntitiesByDay(TourDay day, int first,
			int maxResult, Class<T> clazz) {
		List<T> list = null;
		try {
			String sql = "from " + clazz.getName()
					+ " where tourDay = :day order by sort desc";
			TypedQuery<T> query = entityManager().createQuery(sql, clazz);
			query.setParameter("day", day);
			query.setFirstResult(first).setMaxResults(maxResult);
			list = query.getResultList();
		} catch (Exception e) {

		}
		return list;
	}

	public Tour prev() {
		Tour tour = null;
		try {
//			TypedQuery<Tour> query = entityManager().createQuery("from Tour where id < :id and type = :type order by id desc", Tour.class);
			TypedQuery<Tour> query = entityManager().createQuery("from Tour where id < :id order by id desc", Tour.class);
			query.setParameter("id", this.getId());
//			query.setParameter("type", this.type);
			query.setFirstResult(0).setMaxResults(1);
			tour = query.getSingleResult();
		} catch (Exception e) {
		}
		return tour;
	}

	public Tour next() {
		Tour tour = null;
		try {
//			TypedQuery<Tour> query = entityManager().createQuery("from Tour where id > :id and type = :type order by id", Tour.class);
			TypedQuery<Tour> query = entityManager().createQuery("from Tour where id > :id order by id asc", Tour.class);
			query.setParameter("id", this.getId());
//			query.setParameter("type", this.type);
			query.setFirstResult(0).setMaxResults(1);
			tour = query.getSingleResult();
		} catch (Exception e) {
		}
		return tour;
	}
	
	public static long countSearch(String name) {
		return entityManager().createQuery("select count(o) from Tour o where name like :name", Long.class).setParameter("name", "%" + name + "%").getSingleResult();
	}
	
	public static List<Tour> search(TourAddress address, TourType type,
			TourDay day, String content) {
		return search(address, type, day, content, 0, (int)countTours());
	}
	
	public static List<Tour> search(TourAddress address, TourType type,
			TourDay day, String content, int first, int maxResult) {
		List<Tour> list = null;
		try {
			CriteriaBuilder cb = entityManager().getCriteriaBuilder();
			CriteriaQuery<Tour> cq = cb.createQuery(Tour.class);
			Root<Tour> root = cq.from(Tour.class);
			Predicate p = cb.and(cb.like(root.<String> get("name"), "%"
					+ content + "%"));
			if (type != null) {
				p.getExpressions()
						.add(cb.and(cb.equal(root.get("type"), type)));
			}
			if (address != null) {
				p.getExpressions().add(
						cb.and(cb.equal(root.get("address"), address)));
			}
			if (day != null) {
				p.getExpressions().add(
						cb.and(cb.equal(root.get("tourDay"), day)));
			}
			cq.orderBy(cb.desc(root.get("sort")));
			cq.where(p);
			list = entityManager().createQuery(cq).setFirstResult(first).setMaxResults(maxResult).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static List<Tour> findByRecommend(int first, int maxResult) {
		List<Tour> list = null;
		try {
			TypedQuery<Tour> query = entityManager()
					.createQuery(
							"from Tour where recommend = :recommend order by sort desc",
							Tour.class);
			query.setParameter("recommend", Recommend.findRecommend(2L));
			query.setFirstResult(first).setMaxResults(maxResult);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public static long countByType(TourType type) {
		if (type == null) {
			return 0;
		}
		return entityManager()
				.createQuery("select count(o) from Tour o where type = :type",
						Long.class).setParameter("type", type).getSingleResult();
	}
	
	public static long countByDay(TourDay day) {
		if(day == null) {
			return 0;
		}
		return entityManager()
				.createQuery("select count(o) from Tour o where tourDay = :tourDay",
						Long.class).setParameter("tourDay", day).getSingleResult();
	}
	
	public static long countByAddress(TourAddress address) {
		if(address == null) {
			return 0;
		}
		return entityManager()
				.createQuery("select count(o) from Tour o where address = :address",
						Long.class).setParameter("address", address).getSingleResult();
	}
	
	public static TypedQuery<Tour> findToursByAddress(TourAddress address) {
        if (address == null) throw new IllegalArgumentException("The address argument is required");
        EntityManager em = Tour.entityManager();
        TypedQuery<Tour> q = em.createQuery("SELECT o FROM Tour AS o WHERE o.address = :address", Tour.class);
        q.setParameter("address", address);
        return q;
    }

	public static TypedQuery<Tour> findToursByNameLike(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        name = name.replace('*', '%');
        if (name.charAt(0) != '%') {
            name = "%" + name;
        }
        if (name.charAt(name.length() - 1) != '%') {
            name = name + "%";
        }
        EntityManager em = Tour.entityManager();
        TypedQuery<Tour> q = em.createQuery("SELECT o FROM Tour AS o WHERE LOWER(o.name) LIKE LOWER(:name)", Tour.class);
        q.setParameter("name", name);
        return q;
    }

	public static TypedQuery<Tour> findToursByTourDay(TourDay tourDay) {
        if (tourDay == null) throw new IllegalArgumentException("The tourDay argument is required");
        EntityManager em = Tour.entityManager();
        TypedQuery<Tour> q = em.createQuery("SELECT o FROM Tour AS o WHERE o.tourDay = :tourDay", Tour.class);
        q.setParameter("tourDay", tourDay);
        return q;
    }

	public static TypedQuery<Tour> findToursByType(TourType type) {
        if (type == null) throw new IllegalArgumentException("The type argument is required");
        EntityManager em = Tour.entityManager();
        TypedQuery<Tour> q = em.createQuery("SELECT o FROM Tour AS o WHERE o.type = :type", Tour.class);
        q.setParameter("type", type);
        return q;
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new Tour().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countTours() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Tour o", Long.class).getSingleResult();
    }

	public static List<Tour> findAllTours() {
        return entityManager().createQuery("SELECT o FROM Tour o", Tour.class).getResultList();
    }

	public static Tour findTour(Long id) {
        if (id == null) return null;
        return entityManager().find(Tour.class, id);
    }

	public static List<Tour> findTourEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Tour o", Tour.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            Tour attached = Tour.findTour(this.id);
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
    public Tour merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Tour merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
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

	public Float getPrivilege() {
        return this.privilege;
    }

	public void setPrivilege(Float privilege) {
        this.privilege = privilege;
    }

	public Float getChildren() {
        return this.children;
    }

	public void setChildren(Float children) {
        this.children = children;
    }

	public TourAddress getAddress() {
        return this.address;
    }

	public void setAddress(TourAddress address) {
        this.address = address;
    }

	public TourType getType() {
        return this.type;
    }

	public void setType(TourType type) {
        this.type = type;
    }

	public TourDay getTourDay() {
        return this.tourDay;
    }

	public void setTourDay(TourDay tourDay) {
        this.tourDay = tourDay;
    }

	public String getImage() {
        return this.image;
    }

	public void setImage(String image) {
        this.image = image;
    }

	public String getStartCity() {
        return this.startCity;
    }

	public void setStartCity(String startCity) {
        this.startCity = startCity;
    }

	public String getGroupDate() {
        return this.groupDate;
    }

	public void setGroupDate(String groupDate) {
        this.groupDate = groupDate;
    }

	public String getWay() {
        return this.way;
    }

	public void setWay(String way) {
        this.way = way;
    }

	public String getFeature() {
        return this.feature;
    }

	public void setFeature(String feature) {
        this.feature = feature;
    }

	public String getPlan() {
        return this.plan;
    }

	public void setPlan(String plan) {
        this.plan = plan;
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
	
	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
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
