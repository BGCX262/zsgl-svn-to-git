package com.zsgl.domain;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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

@Configurable
@Entity
@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findTourTypesByNameLike" })
public class TourType {

    @Size(min = 2)
    private String name;
    
    public static TourType getSingleByName(String name) {
    	TourType type = null;
    	try {
    		TypedQuery<TourType> query = findTourTypesByNameLike(name);
    		query.setFirstResult(0);
    		query.setMaxResults(1).setHint("org.hibernate.cacheable", true);
    		type = query.getSingleResult();
		} catch (Exception e) {
		}
		return type;
    }

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new TourType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countTourTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TourType o", Long.class).getSingleResult();
    }

	public static List<TourType> findAllTourTypes() {
        return entityManager().createQuery("SELECT o FROM TourType o", TourType.class).getResultList();
    }

	public static TourType findTourType(Long id) {
        if (id == null) return null;
        return entityManager().find(TourType.class, id);
    }

	public static List<TourType> findTourTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TourType o", TourType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            TourType attached = TourType.findTourType(this.id);
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
    public TourType merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TourType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public static TypedQuery<TourType> findTourTypesByNameLike(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        name = name.replace('*', '%');
        if (name.charAt(0) != '%') {
            name = "%" + name;
        }
        if (name.charAt(name.length() - 1) != '%') {
            name = name + "%";
        }
        EntityManager em = TourType.entityManager();
        TypedQuery<TourType> q = em.createQuery("SELECT o FROM TourType AS o WHERE LOWER(o.name) LIKE LOWER(:name)", TourType.class);
        q.setParameter("name", name);
        return q;
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
}
