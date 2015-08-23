package com.zsgl.domain;

import java.util.List;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
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
public class DiyTour extends Tour {

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public static long countDiyTours() {
        return entityManager().createQuery("SELECT COUNT(o) FROM DiyTour o", Long.class).getSingleResult();
    }

	public static List<DiyTour> findAllDiyTours() {
        return entityManager().createQuery("SELECT o FROM DiyTour o", DiyTour.class).getResultList();
    }

	public static DiyTour findDiyTour(Long id) {
        if (id == null) return null;
        return entityManager().find(DiyTour.class, id);
    }

	public static List<DiyTour> findDiyTourEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM DiyTour o", DiyTour.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }

	@Transactional
    public DiyTour merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        DiyTour merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
}
