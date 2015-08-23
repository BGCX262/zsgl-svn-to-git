package com.zsgl.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.Version;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

@Entity
@Configurable
@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Scenic {

    @Size(min = 1)
    private String name;

    @Size(min = 1)
    private String image;

    @ManyToOne
    private ScenicAddress address;

    private Float doorPrice;

    @ManyToOne
    private Strength strength;

    @Size(max = 50000)
    private String content;

    private Integer sort;
    
    private String keywords;
	
	private String description;

    public static List<com.zsgl.domain.Scenic> getSortScenics(int first, int maxResult) {
        List<Scenic> list = null;
        try {
            TypedQuery<Scenic> query = entityManager().createQuery("from Scenic order by sort asc", Scenic.class);
            query.setFirstResult(first).setMaxResults(maxResult).setHint("org.hibernate.cacheable", true);
            list = query.getResultList();
        } catch (Exception e) {
        }
        return list;
    }
    
    public Scenic prev() {
    	Scenic obj = null;
    	try {
			TypedQuery<Scenic> query = entityManager().createQuery("from Scenic where id < :id order by id desc", Scenic.class);
			query.setParameter("id", this.getId());
			query.setFirstResult(0).setMaxResults(1).setHint("org.hibernate.cacheable", true);
			obj = query.getSingleResult();
		} catch (Exception e) {
		}
    	return obj;
    }
    
    public Scenic next() {
    	Scenic obj = null;
    	try {
			TypedQuery<Scenic> query = entityManager().createQuery("from Scenic where id > :id order by id asc", Scenic.class);
			query.setParameter("id", this.getId());
			query.setFirstResult(0).setMaxResults(1).setHint("org.hibernate.cacheable", true);
			obj = query.getSingleResult();
		} catch (Exception e) {
		}
    	return obj;
    }
    
    public static List<Scenic> find(ScenicAddress address, String content, int first, int maxResult) {
    	TypedQuery<Scenic> query = null;
    	if(address != null) {
    		query = entityManager().createQuery("from Scenic where address = :address and name like :name order by id asc", Scenic.class);
    		query.setParameter("address", address);
    	} else {
    		query = entityManager().createQuery("from Scenic where name like :name order by id asc", Scenic.class);
    	}
    	query.setParameter("name", "%" + content + "%");
    	return query.setFirstResult(first).setMaxResults(maxResult).getResultList();
    }
    
    public static long findCount(ScenicAddress address, String content) {
    	TypedQuery<Scenic> query = null;
    	if(address != null) {
    		query = entityManager().createQuery("from Scenic where address = :address and name like :name order by id asc", Scenic.class);
    		query.setParameter("address", address);
    	} else {
    		query = entityManager().createQuery("from Scenic where name like :name order by id asc", Scenic.class);
    	}
    	query.setParameter("name", "%" + content + "%");
    	return query.getResultList().size();
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new Scenic().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countScenics() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Scenic o", Long.class).getSingleResult();
    }

	public static List<Scenic> findAllScenics() {
        return entityManager().createQuery("SELECT o FROM Scenic o", Scenic.class).getResultList();
    }

	public static Scenic findScenic(Long id) {
        if (id == null) return null;
        return entityManager().find(Scenic.class, id);
    }

	public static List<Scenic> findScenicEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Scenic o", Scenic.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            Scenic attached = Scenic.findScenic(this.id);
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
    public Scenic merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Scenic merged = this.entityManager.merge(this);
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

	public String getImage() {
        return this.image;
    }

	public void setImage(String image) {
        this.image = image;
    }

	public ScenicAddress getAddress() {
        return this.address;
    }

	public void setAddress(ScenicAddress address) {
        this.address = address;
    }

	public Float getDoorPrice() {
        return this.doorPrice;
    }

	public void setDoorPrice(Float doorPrice) {
        this.doorPrice = doorPrice;
    }

	public Strength getStrength() {
        return this.strength;
    }

	public void setStrength(Strength strength) {
        this.strength = strength;
    }

	public String getContent() {
        return this.content;
    }

	public void setContent(String content) {
        this.content = content;
    }

	public Integer getSort() {
        return this.sort;
    }

	public void setSort(Integer sort) {
        this.sort = sort;
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
