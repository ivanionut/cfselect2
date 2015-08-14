<cfsetting enablecfoutputonly="true">
<cfcomponent>
  <!---  *********************************************************************************** 
       *  Info       : Select2 suggestion dropdown
       *  Parameter  : key,page,page_limit,db
       *  Author     : Mohamad Zulhelmi Redzwan
       *  Date       : 30 Julai 2015
       ***********************************************************************************
  --->
  <cffunction name="find" access="remote" output="true" returnformat="JSON" securejson="true" returntype="any">
    <cfargument name="key"  required="false" type="string" hint="data">
    <cfargument name="page" type="numeric" required="true">
    <cfargument name="page_limit" type="numeric" default="10">
    <cfargument name="db"  required="false" type="string" hint="data" default="#request.datasource#">
    
    <cfset var startRow = (arguments.page * arguments.page_limit) - arguments.page_limit + 1>
        <cfset var endRow = startRow + arguments.page_limit>

        <cfset var getClientsByName = "">
        <cfset var results = structNew()>
        <cfset var clients = arrayNew(1)>
        <cfset var elem = "">

    <cfquery name="qdetails" datasource="#db#" maxrows="#endRow#">
            SELECT id,name FROM yourtable
            WHERE UPPER(name) LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#UCASE(trim(Arguments.key))#%">
    </cfquery>

    <cfloop query="qdetails" startRow="#startRow#" endRow="#endRow#">
            <cfset elem = structNew()>
            <cfset elem["id"] = qdetails.id>
            <cfset elem["text"] = qdetails.name>
            <cfset arrayAppend(clients, elem)>
        </cfloop>

         <!--- package the results into a structure --->  
        <cfset results["total"] = qdetails.recordCount>
        <cfset results["clients"] = clients>

        <cfcontent type="application/json" reset="true">
        <cfoutput>#serializeJSON(results)#</cfoutput><cfabort />

  </cffunction>
</cfcomponent>