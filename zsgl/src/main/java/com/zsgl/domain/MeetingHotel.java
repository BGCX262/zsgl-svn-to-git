package com.zsgl.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.TypedQuery;

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
public class MeetingHotel extends Hotel {
	
	/*
    @Size(min = 1)
    private String name;

    @Size(min = 1)
    private String image;

    @Size(max = 4000)
    private String content;
    */
    
    public static List<MeetingHotel> getSortEntries(int first, int maxResult) {
    	List<MeetingHotel> list = null;
    	try {
			TypedQuery<MeetingHotel> query = entityManager().createQuery("from MeetingHotel order by id desc", MeetingHotel.class);
			query.setFirstResult(first).setMaxResults(maxResult).setHint("org.hibernate.cacheable", true);
			list = query.getResultList();
		} catch (Exception e) {
		}
    	return list;
    }

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public static long countMeetingHotels() {
        return entityManager().createQuery("SELECT COUNT(o) FROM MeetingHotel o", Long.class).getSingleResult();
    }

	public static List<MeetingHotel> findAllMeetingHotels() {
        return entityManager().createQuery("SELECT o FROM MeetingHotel o", MeetingHotel.class).getResultList();
    }

	public static MeetingHotel findMeetingHotel(Long id) {
        if (id == null) return null;
        return entityManager().find(MeetingHotel.class, id);
    }

	public static List<MeetingHotel> findMeetingHotelEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM MeetingHotel o", MeetingHotel.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	@Transactional
    public MeetingHotel merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        MeetingHotel merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
}
