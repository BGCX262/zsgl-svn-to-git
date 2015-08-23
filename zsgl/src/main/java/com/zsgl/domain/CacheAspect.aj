package com.zsgl.domain;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

public aspect CacheAspect {
	
	declare @type: com.zsgl.domain.*: @Cache(usage = CacheConcurrencyStrategy.READ_WRITE);
	
}
