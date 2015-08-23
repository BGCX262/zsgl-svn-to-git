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

@Entity
@Configurable
@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findHotelAddressesByNameLike", "findHotelAddressesByNameEquals" })
public class HotelAddress {

    @Size(min = 2)
    private String name;
    
    public static HotelAddress findSingleByName(String name) {
    	HotelAddress obj = null;
    	try {
			TypedQuery<HotelAddress> query = findHotelAddressesByNameLike(name);
			query.setFirstResult(0);
			query.setMaxResults(1).setHint("org.hibernate.cacheable", true);
			obj = query.getSingleResult();
		} catch (Exception e) {
		}
    	return obj;
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

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new HotelAddress().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countHotelAddresses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM HotelAddress o", Long.class).getSingleResult();
    }

	public static List<HotelAddress> findAllHotelAddresses() {
        return entityManager().createQuery("SELECT o FROM HotelAddress o", HotelAddress.class).getResultList();
    }

	public static HotelAddress findHotelAddress(Long id) {
        if (id == null) return null;
        return entityManager().find(HotelAddress.class, id);
    }

	public static List<HotelAddress> findHotelAddressEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM HotelAddress o", HotelAddress.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            HotelAddress attached = HotelAddress.findHotelAddress(this.id);
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
    public HotelAddress merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        HotelAddress merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public static TypedQuery<HotelAddress> findHotelAddressesByNameEquals(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        EntityManager em = HotelAddress.entityManager();
        TypedQuery<HotelAddress> q = em.createQuery("SELECT o FROM HotelAddress AS o WHERE o.name = :name", HotelAddress.class);
        q.setParameter("name", name);
        return q;
    }

	public static TypedQuery<HotelAddress> findHotelAddressesByNameLike(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        name = name.replace('*', '%');
        if (name.charAt(0) != '%') {
            name = "%" + name;
        }
        if (name.charAt(name.length() - 1) != '%') {
            name = name + "%";
        }
        EntityManager em = HotelAddress.entityManager();
        TypedQuery<HotelAddress> q = em.createQuery("SELECT o FROM HotelAddress AS o WHERE LOWER(o.name) LIKE LOWER(:name)", HotelAddress.class);
        q.setParameter("name", name);
        return q;
    }
}
