package com.zsgl.domain;

import java.util.List;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
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
public class MeetingTour extends Tour {
	
	public static List<MeetingTour> getSortEntries(int first, int maxResult) {
    	List<MeetingTour> list = null;
    	try {
			TypedQuery<MeetingTour> query = entityManager().createQuery("from MeetingTour order by id desc", MeetingTour.class);
			query.setFirstResult(first).setMaxResults(maxResult).setHint("org.hibernate.cacheable", true);
			list = query.getResultList();
		} catch (Exception e) {
		}
    	return list;
    }
	

	public static long countMeetingTours() {
        return entityManager().createQuery("SELECT COUNT(o) FROM MeetingTour o", Long.class).getSingleResult();
    }

	public static List<MeetingTour> findAllMeetingTours() {
        return entityManager().createQuery("SELECT o FROM MeetingTour o", MeetingTour.class).getResultList();
    }

	public static MeetingTour findMeetingTour(Long id) {
        if (id == null) return null;
        return entityManager().find(MeetingTour.class, id);
    }

	public static List<MeetingTour> findMeetingTourEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM MeetingTour o", MeetingTour.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	@Transactional
    public MeetingTour merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        MeetingTour merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
