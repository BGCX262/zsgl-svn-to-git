package com.zsgl.preparer;

import java.util.Map;

public class TemplatePreparer3 extends AbstractPreparer{

	@Override
	protected void action(Map<String, Object> model) {
		fillScenicAddress(model);
		fillJdss(model);
		fillTjlx(model);
		fillKsdh(model);
	}
	
}
