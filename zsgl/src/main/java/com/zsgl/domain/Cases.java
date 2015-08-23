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
@RooJpaActiveRecord
public class Cases {

    @Size(min = 1)
    private String name;

    @Size(max = 50000)
    private String content;
    
    public static List<Cases> getSortEntries(int first, int maxResult) {
    	List<Cases> list = null;
    	try {
			TypedQuery<Cases> query = entityManager().createQuery("from Cases order by id desc", Cases.class);
			query.setFirstResult(first).setMaxResults(maxResult).setHint("org.hibernate.cacheable", true);
			list = query.getResultList();
		} catch (Exception e) {
		}
    	return list;
    }

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public String getContent() {
        return this.content;
    }

	public void setContent(String content) {
        this.content = content;
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new Cases().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countCaseses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Cases o", Long.class).getSingleResult();
    }

	public static List<Cases> findAllCaseses() {
        return entityManager().createQuery("SELECT o FROM Cases o", Cases.class).getResultList();
    }

	public static Cases findCases(Long id) {
        if (id == null) return null;
        return entityManager().find(Cases.class, id);
    }

	public static List<Cases> findCasesEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Cases o", Cases.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            Cases attached = Cases.findCases(this.id);
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
    public Cases merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Cases merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
	
	
	public Cases prev() {
		try {
			return entityManager.createQuery("from Cases where id < :id order by id desc", Cases.class).setParameter("id", this.id).setFirstResult(0).setMaxResults(1).getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}
	
	public Cases next() {
		try {
			return entityManager.createQuery("from Cases where id > :id order by id", Cases.class).setParameter("id", this.id).setFirstResult(0).setMaxResults(1).getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}
	
	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
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
