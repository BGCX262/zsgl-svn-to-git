package com.zsgl.preparer;

import java.util.Map;

public class TemplatePreparer4 extends AbstractPreparer {

	@Override
	protected void action(Map<String, Object> model) {
		fillTjlx(model);
		fillKsdh(model);
	}
	
}
