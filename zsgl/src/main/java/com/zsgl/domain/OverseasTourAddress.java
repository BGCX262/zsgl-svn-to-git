package com.zsgl.domain;

import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.transaction.annotation.Transactional;

@Entity
@Configurable
@RooJavaBean
@RooJpaEntity
@RooJpaActiveRecord
public class OverseasTourAddress {
	
	private String name;
	
	@OneToMany(mappedBy = "city")
	private Set<OverseasTour> overseasTours;

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

	public Set<OverseasTour> getOverseasTours() {
        return this.overseasTours;
    }

	public void setOverseasTours(Set<OverseasTour> overseasTours) {
        this.overseasTours = overseasTours;
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new OverseasTourAddress().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countOverseasTourAddresses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM OverseasTourAddress o", Long.class).getSingleResult();
    }

	public static List<OverseasTourAddress> findAllOverseasTourAddresses() {
        return entityManager().createQuery("SELECT o FROM OverseasTourAddress o", OverseasTourAddress.class).getResultList();
    }

	public static OverseasTourAddress findOverseasTourAddress(Long id) {
        if (id == null) return null;
        return entityManager().find(OverseasTourAddress.class, id);
    }

	public static List<OverseasTourAddress> findOverseasTourAddressEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM OverseasTourAddress o", OverseasTourAddress.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            OverseasTourAddress attached = OverseasTourAddress.findOverseasTourAddress(this.id);
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
    public OverseasTourAddress merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        OverseasTourAddress merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
}
