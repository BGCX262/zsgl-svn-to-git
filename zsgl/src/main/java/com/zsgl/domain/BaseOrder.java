package com.zsgl.domain;

import java.util.ArrayList;
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

/**
 * 基本订单
 * @author itachi
 *
 */
@Configurable
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn
@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "SINGLE_TABLE", finders = { "findBaseOrdersByContactLike" })
public class BaseOrder {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

	@Version
    @Column(name = "version")
    private Integer version;
	
	/**
	 * 联系人
	 */
    @Size(min = 1)
    private String contact;
    
    /**
     * 性别
     */
    private String sex;
    
    /**
     * 邮箱
     */
    @Size(min = 1)
    private String email;
    
    /**
     * 手机
     */
    @Size(min = 1)
    private String phone;
    
    /**
     * 电话
     */
    private String callPhone;
    
    /**
     * QQ
     */
    private String qq;
    
    /**
     * 联系方式
     */
    @ManyToOne
    private Affirm affirm;
    
    /**
     * 预订留言
     */
    @Size(max = 2000)
    private String message;
    
    /**
     * 价格
     */
    private Float price;
    
    /**
     * 订单状态
     */
    @ManyToOne
    private OrderState orderState;
    
	public static <T> List<T> getSortOrders(int first, int maxResult, Class<T> clazz) {
        List<T> list = new ArrayList<T>();
        try {
            String sql = "from " + clazz.getName() + " order by id desc";
            TypedQuery<T> query = entityManager().createQuery(sql, clazz);
            query.setFirstResult(first).setMaxResults(maxResult).setHint("org.hibernate.cacheable", true);
            list = (List<T>) query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static <T> List<T> findOrderByState(OrderState state, Class<T> clazz) {
    	String sql = "from " + clazz.getName() + " where orderState = :state order by id desc";
        TypedQuery<T> query = entityManager().createQuery(sql, clazz);
        query.setParameter("state", state);
        return query.getResultList();
    }

	public static TypedQuery<BaseOrder> findBaseOrdersByContactLike(String contact) {
        if (contact == null || contact.length() == 0) throw new IllegalArgumentException("The contact argument is required");
        contact = contact.replace('*', '%');
        if (contact.charAt(0) != '%') {
            contact = "%" + contact;
        }
        if (contact.charAt(contact.length() - 1) != '%') {
            contact = contact + "%";
        }
        EntityManager em = BaseOrder.entityManager();
        TypedQuery<BaseOrder> q = em.createQuery("SELECT o FROM BaseOrder AS o WHERE LOWER(o.contact) LIKE LOWER(:contact)", BaseOrder.class);
        q.setParameter("contact", contact);
        return q;
    }

	public String getContact() {
        return this.contact;
    }

	public void setContact(String contact) {
        this.contact = contact;
    }

	public String getSex() {
        return this.sex;
    }

	public void setSex(String sex) {
        this.sex = sex;
    }

	public String getEmail() {
        return this.email;
    }

	public void setEmail(String email) {
        this.email = email;
    }

	public String getPhone() {
        return this.phone;
    }

	public void setPhone(String phone) {
        this.phone = phone;
    }

	public String getCallPhone() {
        return this.callPhone;
    }

	public void setCallPhone(String callPhone) {
        this.callPhone = callPhone;
    }

	public String getQq() {
        return this.qq;
    }

	public void setQq(String qq) {
        this.qq = qq;
    }

	public Affirm getAffirm() {
        return this.affirm;
    }

	public void setAffirm(Affirm affirm) {
        this.affirm = affirm;
    }

	public String getMessage() {
        return this.message;
    }

	public void setMessage(String message) {
        this.message = message;
    }

	public Float getPrice() {
        return this.price;
    }

	public void setPrice(Float price) {
        this.price = price;
    }

	public OrderState getOrderState() {
        return this.orderState;
    }

	public void setOrderState(OrderState orderState) {
        this.orderState = orderState;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new BaseOrder().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countBaseOrders() {
        return entityManager().createQuery("SELECT COUNT(o) FROM BaseOrder o", Long.class).getSingleResult();
    }

	public static List<BaseOrder> findAllBaseOrders() {
        return entityManager().createQuery("SELECT o FROM BaseOrder o", BaseOrder.class).getResultList();
    }

	public static BaseOrder findBaseOrder(Long id) {
        if (id == null) return null;
        return entityManager().find(BaseOrder.class, id);
    }

	public static List<BaseOrder> findBaseOrderEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM BaseOrder o", BaseOrder.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            BaseOrder attached = BaseOrder.findBaseOrder(this.id);
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
    public BaseOrder merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        BaseOrder merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

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
