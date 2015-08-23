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
@RooJpaActiveRecord(finders = { "findTourAddressesByNameEquals", "findTourAddressesByNameLike" })
public class TourAddress {

    @Size(min = 2)
    private String name;

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
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

	public static TypedQuery<TourAddress> findTourAddressesByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = TourAddress.entityManager();
        TypedQuery<TourAddress> q = em.createQuery("SELECT o FROM TourAddress AS o WHERE o.name = :name", TourAddress.class);
        q.setParameter("name", name);
        return q;
    }

	public static TypedQuery<TourAddress> findTourAddressesByNameLike(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        name = name.replace('*', '%');
        if (name.charAt(0) != '%') {
            name = "%" + name;
        }
        if (name.charAt(name.length() - 1) != '%') {
            name = name + "%";
        }
        EntityManager em = TourAddress.entityManager();
        TypedQuery<TourAddress> q = em.createQuery("SELECT o FROM TourAddress AS o WHERE LOWER(o.name) LIKE LOWER(:name)", TourAddress.class);
        q.setParameter("name", name);
        return q;
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new TourAddress().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countTourAddresses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM TourAddress o", Long.class).getSingleResult();
    }

	public static List<TourAddress> findAllTourAddresses() {
        return entityManager().createQuery("SELECT o FROM TourAddress o", TourAddress.class).getResultList();
    }

	public static TourAddress findTourAddress(Long id) {
        if (id == null) return null;
        return entityManager().find(TourAddress.class, id);
    }

	public static List<TourAddress> findTourAddressEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM TourAddress o", TourAddress.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            TourAddress attached = TourAddress.findTourAddress(this.id);
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
    public TourAddress merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        TourAddress merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
