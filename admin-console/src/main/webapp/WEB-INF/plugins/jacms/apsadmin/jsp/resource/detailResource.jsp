<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="wp" uri="/aps-core"%>
<%@ taglib prefix="wpsf" uri="/apsadmin-form"%>

<s:set var="resource" value="%{loadResource(resourceId)}"/>
<ol class="breadcrumb page-tabs-header breadcrumb-position">
    <li>
        <s:text name="breadcrumb.app" />
    </li>
    <li>
        <s:text name="breadcrumb.jacms" />
    </li>
    <li>
        <s:text name="breadcrumb.digitalAsset" />
    </li>
    <li>
        <a
            href="<s:url action="list" ><s:param name="#resource.type" ><s:text name="%{#resource.type}"></s:text></s:param></s:url>">
            <s:property value="%{getText('breadcrumb.dataAsset.' + #resource.type + '.list')}" />
        </a>
    </li>
    <li class="page-title-container">
        <s:text name="title.%{#resource.type}.detail" />
    </li>
</ol>
<h1 class="page-title-container">
    <s:text name="title.%{#resource.type}.detail" />
    <span class="pull-right">
        <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-html="true" title=""
            data-original-title=""
            data-content="<s:property value="%{getText('help.' + #resource.type + '.detail.info')}" escapeXml="true" />"
            data-placement="left">
            <i class="fa fa-question-circle-o" aria-hidden="true"></i>
        </a>
    </span>
</h1>
<i class="fa fa-asterisk required-icon"></i>
<div class="form-group-separator"></div>
<br />

<div id="main" role="main">
    <button type="button" data-toggle="collapse" data-target="#jpcontentinspection_metadata" class="btn btn-default">
        <s:text name="title.metadata" />
        <span class="icon-chevron-down"></span>
    </button>
    <br>
    <br>
    <div class="collapse" id="jpcontentinspection_metadata">
        <table class="table table-bordered">
            <tr>
                <th class="td-pagetree-width">
                    <s:text name="label.description" />
                </th>
                <td>
                    <s:property value="#resource.descr" />
                </td>
            </tr>
            <tr>
                <th class="td-pagetree-width">
                    <s:text name="label.key" />
                </th>
                <td>
                    <s:property value="resourceId" />
                </td>
            </tr>
            <tr>
                <th class="td-pagetree-width">
                    <s:text name="label.group" />
                </th>
                <td>
                    <s:property value="#resource.mainGroup"/>
                </td>
            </tr>
            <tr>
                <th class="td-pagetree-width">
                    <s:text name="label.type" />
                </th>
                <td>
                    <s:property value="#resource.type" />
                </td>
            </tr>
            <tr>
                <th class="td-pagetree-width">
                    <s:text name="label.filename" />
                </th>
                <td>
                    <s:property value="#resource.masterFileName" />
                </td>
            </tr>
            <tr>
                <th class="td-pagetree-width">
                    <s:text name="label.creationDate" />
                </th>
                <td><s:date name="#resource.creationDate" format="dd/MM/yyyy HH:mm" /></td>
            </tr>
            <tr>
                <th class="td-pagetree-width">
                    <s:text name="label.lastEdit" />
                </th>
                <td title="<s:date name="#resource.lastModified" format="EEEE d MMMM yyyy, HH:mm" />">
                    <span title="<s:date name="#resource.lastModified" format="EEEE d MMMM yyyy, HH:mm" />"><s:date name="#resource.lastModified" format="dd/MM/yyyy HH:mm" nice="true" /></span>
                </td>
            </tr>
            <tr>
                <th class="td-pagetree-width">
                    <s:text name="label.categories" />
                </th>
                <td>
                    <s:if test="!#resource.categories.empty">
                        <ul class="list-unstyled">
                            <s:iterator var="curCategory" value="#resource.categories" status="catStatus">
                                <li>
                                    <s:property value="%{#curCategory.getFullTitle(currentLang.code)}" />
                                </li>
                            </s:iterator>
                        </ul>
                    </s:if>
                    <s:else>
                        <span class="text-muted">
                            <s:text name="label.none" />
                        </span>
                    </s:else>
                </td>
            </tr>
            <tr>
                <th class="td-pagetree-width">
                    <s:text name="label.thumbnail" />
                </th>
                <td class="text-left">
                    <img src="<s:property value="%{#resource.getImagePath(1)}"/>" alt="${resource.descr}" class="img-responsive"/>
                </td>
            </tr>
        </table>
    </div>
</div>
<s:form action="detail" method="post">
    <p class="sr-only">
        <wpsf:hidden name="resourceId" />
    </p>
    <s:set var="referencingContentsId" value="references['jacmsContentManagerUtilizers']" />
    <s:include value="/WEB-INF/plugins/jacms/apsadmin/jsp/portal/include/referencingContents.jsp" />
</s:form>
