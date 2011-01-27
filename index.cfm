<cfsetting enablecfoutputonly="Yes">

<cfparam name="url._url" default="http://www.google.com/" />
<cfset oGoogl = CreateObject("component", "googl").init() />

<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<html lang="en">
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Google URL Shortener CFC</title>
	
	<style>
	
	* {
		font-family: helvetica;
	}
	
	##url {
		width: 250px;
	}
	
	</style>

</head>
<body>

<h1>Google URL Shortener</h1>

<p><a href="http://goo.gl/c4yjS">Read more about it.</a></p>

<form method="post">

	<p>URL:<br />
	<input id="url" type="text" name="_url" value="#url._url#" /></p>

	<p><input type="submit" name="submit" value="Shorten" /></p>

</form>

</cfoutput>

<!--- shortener --->
<cfif isDefined('form.submit')>
	
	<cfset s = oGoogl.shorten(form._url) />
	<cfdump var="#s#" />
	
</cfif>

<cfoutput>
	</body>
	</html>
</cfoutput>

<cfsetting enablecfoutputonly="No">