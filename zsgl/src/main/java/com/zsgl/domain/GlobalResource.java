package com.zsgl.domain;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.transaction.annotation.Transactional;

@Configurable
@Entity
@RooJavaBean
@RooJpaEntity
@RooJpaActiveRecord
public class GlobalResource {
	
	private String title;
	
	private String logo;
	
	@Size(max = 1000)
	private String seo;
	
	private String keywords;
	
	private String description;
	
	@Size(max = 1000)
	private String foot;
	
	@Size(max = 4000)
	private String script;
	
	@Size(max = 30000)
	private String contact;
	
	private String image1;
	
	private String image2;
	
	private String image3;
	
	private String image4;

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new GlobalResource().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countGlobalResources() {
        return entityManager().createQuery("SELECT COUNT(o) FROM GlobalResource o", Long.class).getSingleResult();
    }

	public static List<GlobalResource> findAllGlobalResources() {
        return entityManager().createQuery("SELECT o FROM GlobalResource o", GlobalResource.class).getResultList();
    }

	public static GlobalResource findGlobalResource(Long id) {
        if (id == null) return null;
        return entityManager().find(GlobalResource.class, id);
    }

	public static List<GlobalResource> findGlobalResourceEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM GlobalResource o", GlobalResource.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            GlobalResource attached = GlobalResource.findGlobalResource(this.id);
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
    public GlobalResource merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        GlobalResource merged = this.entityManager.merge(this);
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

	public String getTitle() {
        return this.title;
    }

	public void setTitle(String title) {
        this.title = title;
    }

	public String getLogo() {
        return this.logo;
    }

	public void setLogo(String logo) {
        this.logo = logo;
    }

	public String getSeo() {
        return this.seo;
    }

	public void setSeo(String seo) {
        this.seo = seo;
    }

	public String getFoot() {
        return this.foot;
    }

	public void setFoot(String foot) {
        this.foot = foot;
    }

	public String getScript() {
        return this.script;
    }

	public void setScript(String script) {
        this.script = script;
    }

	public String getContact() {
        return this.contact;
    }

	public void setContact(String contact) {
        this.contact = contact;
    }

	public String getImage1() {
        return this.image1;
    }

	public void setImage1(String image1) {
        this.image1 = image1;
    }

	public String getImage2() {
        return this.image2;
    }

	public void setImage2(String image2) {
        this.image2 = image2;
    }

	public String getImage3() {
        return this.image3;
    }

	public void setImage3(String image3) {
        this.image3 = image3;
    }

	public String getImage4() {
        return this.image4;
    }

	public void setImage4(String image4) {
        this.image4 = image4;
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
