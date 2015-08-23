package com.zsgl.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PersistenceContext;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import javax.persistence.Version;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

@Entity
@Configurable
@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Strategy {

    @Size(min = 1)
    private String name;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date updateTime;

    @Size(max = 50000)
    private String content;
    
    @ManyToOne
    private StrategyType type;
    
    private String keywords;
	
	private String description;
    
    public static List<Strategy> getSortStrategy(int first, int maxResult) {
    	List<Strategy> list = null;
    	try {
    		TypedQuery<Strategy> query = entityManager().createQuery("from Strategy order by id desc", Strategy.class);
    		query.setHint("org.hibernate.cacheable", true);
    		query.setFirstResult(first).setMaxResults(maxResult).setHint("org.hibernate.cacheable", true);
    		list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return list;
    }
    
    /**
     * 算出该类型的记录总数
     * @param type
     * @return
     */
    public static long countType(StrategyType type) {
    	return entityManager().createQuery("select count(o) from Strategy o where type = :type", Long.class).setParameter("type", type).getSingleResult();
    }
    
    /**
     * 通过类型进行倒序查询
     * @param type
     * @param first
     * @param maxResult
     * @return
     */
    public static List<Strategy> getSortStrategyByType(StrategyType type, int first, int maxResult) {
    	List<Strategy> list = null;
    	try {
    		
    		if(type != null) {
    			TypedQuery<Strategy> query = entityManager().createQuery("from Strategy where type = :type order by id desc", Strategy.class);
    			query.setParameter("type", type);
    			query.setFirstResult(first).setMaxResults(maxResult);
    			list = query.getResultList();
    		} else {
    			list = getSortStrategy(first, maxResult);
    		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return list;
    }
    
    /**
     * 上一条
     * @return
     */
    public Strategy prev() {
    	Strategy obj = null;
    	try {
//			TypedQuery<Strategy> query = entityManager().createQuery("from Strategy where id < :id and type = :type order by id desc", Strategy.class);
    		TypedQuery<Strategy> query = entityManager().createQuery("from Strategy where id < :id order by id desc", Strategy.class);
			query.setParameter("id", this.getId());
//			query.setParameter("type", this.type);
			query.setFirstResult(0).setMaxResults(1);
			obj = query.getSingleResult();
		} catch (Exception e) {
		}
    	return obj;
    }
    
    /**
     * 下一条
     * @return
     */
    public Strategy next() {
    	Strategy obj = null;
    	try {
//			TypedQuery<Strategy> query = entityManager().createQuery("from Strategy where id > :id and type = :type order by id", Strategy.class);
			TypedQuery<Strategy> query = entityManager().createQuery("from Strategy where id > :id order by id", Strategy.class);
			query.setParameter("id", this.getId());
//			query.setParameter("type", this.type);
			query.setFirstResult(0).setMaxResults(1);
			obj = query.getSingleResult();
		} catch (Exception e) {
		}
    	return obj;
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

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new Strategy().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countStrategys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Strategy o", Long.class).getSingleResult();
    }

	public static List<Strategy> findAllStrategys() {
        return entityManager().createQuery("SELECT o FROM Strategy o", Strategy.class).getResultList();
    }

	public static Strategy findStrategy(Long id) {
        if (id == null) return null;
        return entityManager().find(Strategy.class, id);
    }

	public static List<Strategy> findStrategyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Strategy o order by id desc", Strategy.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
	
	public static Strategy findByName(String name) {
		try {
			return entityManager().createQuery("SELECT o from Strategy o where name=:name", Strategy.class).setParameter("name", name).setMaxResults(1).getSingleResult();
		} catch (Exception e) {
			return null;
		}
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
            Strategy attached = Strategy.findStrategy(this.id);
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
    public Strategy merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Strategy merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public Date getUpdateTime() {
        return this.updateTime;
    }

	public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

	public String getContent() {
        return this.content;
    }

	public void setContent(String content) {
        this.content = content;
    }

	public StrategyType getType() {
        return this.type;
    }

	public void setType(StrategyType type) {
        this.type = type;
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
