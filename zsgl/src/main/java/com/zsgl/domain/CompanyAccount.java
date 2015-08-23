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
@RooJpaActiveRecord(finders = { "findCompanyAccountsByAccountType" })
public class CompanyAccount {

    @Size(min = 1)
    private String name;

    @Size(min = 1)
    private String cardid;

    @Size(min = 1)
    private String bank;

    @Size(min = 1)
    private String image;

    @ManyToOne
    private BankType type;

    @ManyToOne
    private AccountType accountType;

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

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	@PersistenceContext
    transient EntityManager entityManager;

	public static final EntityManager entityManager() {
        EntityManager em = new CompanyAccount().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }

	public static long countCompanyAccounts() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CompanyAccount o", Long.class).getSingleResult();
    }

	public static List<CompanyAccount> findAllCompanyAccounts() {
        return entityManager().createQuery("SELECT o FROM CompanyAccount o", CompanyAccount.class).getResultList();
    }

	public static CompanyAccount findCompanyAccount(Long id) {
        if (id == null) return null;
        return entityManager().find(CompanyAccount.class, id);
    }

	public static List<CompanyAccount> findCompanyAccountEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CompanyAccount o", CompanyAccount.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
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
            CompanyAccount attached = CompanyAccount.findCompanyAccount(this.id);
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
    public CompanyAccount merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CompanyAccount merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public static TypedQuery<CompanyAccount> findCompanyAccountsByAccountType(AccountType accountType) {
        if (accountType == null) throw new IllegalArgumentException("The accountType argument is required");
        EntityManager em = CompanyAccount.entityManager();
        TypedQuery<CompanyAccount> q = em.createQuery("SELECT o FROM CompanyAccount AS o WHERE o.accountType = :accountType", CompanyAccount.class);
        q.setParameter("accountType", accountType);
        return q;
    }

	public String getName() {
        return this.name;
    }

	public void setName(String name) {
        this.name = name;
    }

	public String getCardid() {
        return this.cardid;
    }

	public void setCardid(String cardid) {
        this.cardid = cardid;
    }

	public String getBank() {
        return this.bank;
    }

	public void setBank(String bank) {
        this.bank = bank;
    }

	public String getImage() {
        return this.image;
    }

	public void setImage(String image) {
        this.image = image;
    }

	public BankType getType() {
        return this.type;
    }

	public void setType(BankType type) {
        this.type = type;
    }

	public AccountType getAccountType() {
        return this.accountType;
    }

	public void setAccountType(AccountType accountType) {
        this.accountType = accountType;
    }
}
