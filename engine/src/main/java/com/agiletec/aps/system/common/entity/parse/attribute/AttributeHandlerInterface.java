/*
 * Copyright 2015-Present Entando Inc. (http://www.entando.com) All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
package com.agiletec.aps.system.common.entity.parse.attribute;

import java.io.Serializable;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

import com.agiletec.aps.system.common.entity.model.attribute.AttributeInterface;

/**
 * Interface for those Handler classes that parse the XML codes of single Attribute Types.
 * @author E.Santoboni
 */
public interface AttributeHandlerInterface extends Serializable {
	
	/**
	 * Return a handler prototype.
	 * @return The handler prototype.
	 */
	public Object getAttributeHandlerPrototype();
	
	/**
	 * Extend the startAttribute of the dell'AttributeHandler, directly handling the XML tags of the
	 * current attribute.
	 * @param attributes The attributes of the current XML tag.
	 * @param qName The name of the current XML tag.
	 * @throws SAXException if errors are detected while parsing
	 */
	public void startAttribute(Attributes attributes, String qName) throws SAXException;
	
	/**
	 * Extend the l'endAttribute of the dell'AttributeHandler, directly handling the XML tags of the
	 * current attribute
	 * @param qName The name of the current XML tag.
	 * @param textBuffer The text read inside the XML tag.
	 */
	public void endAttribute(String qName, StringBuffer textBuffer);
	
	/**
	 * Test if the name of the XML tag corresponds to the ending Entity Attribute.
	 * @param qName The name of the current XML tag.
	 * @return true If the tag corresponds to the end of the current Entity Attribute, false otherwise.
	 */
	public boolean isEndAttribute(String qName);
	
	/**
	 * Set up the current attribute.
	 * @param currentAttr The attribute.
	 */
	public void setCurrentAttr(AttributeInterface currentAttr);
	
}
