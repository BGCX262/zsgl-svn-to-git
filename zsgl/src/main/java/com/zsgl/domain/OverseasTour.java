package com.zsgl.domain;

import java.util.List;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.TypedQuery;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.transaction.annotation.Transactional;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn
@Configurable
@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "SINGLE_TABLE")
@NamedQueries({@NamedQuery(name = "getSortOverseasTour", query = "from OverseasTour order by sort asc")})
public class OverseasTour extends Tour {
	
	@ManyToOne
	@JoinColumn(name = "city_id")
	private OverseasTourAddress city;
	
	public static List<OverseasTour> getSortOverseasTour(int first, int maxResult) {
		List<OverseasTour> list = null;
		try {
			TypedQuery<OverseasTour> query = entityManager().createNamedQuery("getSortOverseasTour", OverseasTour.class);
			query.setFirstResult(first).setMaxResults(maxResult).setHint("org.hibernate.cacheable", true);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static long findCount(OverseasTourAddress city, String content) {
		TypedQuery<Long> query;
		if (city != null) {
			query = entityManager().createQuery("select count(o) from OverseasTour o where city = :city and name like :name order by sort asc", Long.class);
			query.setParameter("city", city);
		} else {
			query = entityManager().createQuery("select count(o) from OverseasTour o where name like :name order by sort asc", Long.class);
		}
		query.setParameter("name", "%" + content + "%");
		return query.getSingleResult();
	}
	
	public static List<OverseasTour> find(OverseasTourAddress city, String content, int first, int maxResult) {
		TypedQuery<OverseasTour> query;
		if (city != null) {
			query = entityManager().createQuery("select o from OverseasTour o where city = :city and name like :name order by sort asc", OverseasTour.class);
			query.setParameter("city", city);
		} else {
			query = entityManager().createQuery("select o from OverseasTour o where name like :name order by sort asc", OverseasTour.class);
		}
		query.setParameter("name", "%" + content + "%").setFirstResult(first).setMaxResults(maxResult);
		return query.getResultList();
	}

	public OverseasTourAddress getCity() {
        return this.city;
    }

	public void setCity(OverseasTourAddress city) {
        this.city = city;
    }

	public static long countOverseasTours() {
        return entityManager().createQuery("SELECT COUNT(o) FROM OverseasTour o", Long.class).getSingleResult();
    }

	public static List<OverseasTour> findAllOverseasTours() {
        return entityManager().createQuery("SELECT o FROM OverseasTour o", OverseasTour.class).getResultList();
    }

	public static OverseasTour findOverseasTour(Long id) {
        if (id == null) return null;
        return entityManager().find(OverseasTour.class, id);
    }

	public static List<OverseasTour> findOverseasTourEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM OverseasTour o", OverseasTour.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	@Transactional
    public OverseasTour merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        OverseasTour merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
