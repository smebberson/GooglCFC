<cfcomponent name="Google URL Shortner">
	
	<cfset _url = 'https://www.googleapis.com/urlshortener/v1/url' />
	<cfset _apiKey = '' />
	
	<cffunction name="init" output="false" returnType="googl">
		<cfargument name="apiKey" type="string" required="false" default="" />
		
		<cfset variables._apiKey = arguments.apiKey />
		
		<cfreturn this>
	</cffunction>
	
	<cffunction name="shorten" returnType="struct">
		<cfargument name="url" type="string" required="true" />
		
		<cfset var sResult = "" />
		<cfset var sContent = '{"longUrl":"#arguments.url#"}' />
		
		<cfhttp url="#getUrl()#" method="post" result="sResult">
			<cfhttpparam type="header" name="Content-Type" value="application/json" />
			<cfhttpparam type="body" value="#sContent.toString()#" />
		</cfhttp>
		
		<cfreturn deserializeJson(sResult.filecontent)>
		
	</cffunction>
	
	<cffunction name="getURL" returnType="string">
		
		<cfset var sUrl = variables._url />
		
		<cfif len(variables._apiKey)><cfset sUrl = sUrl & '&api=' & variables._apiKey /></cfif>
		
		<cfreturn sUrl>
		
	</cffunction>
	
</cfcomponent>