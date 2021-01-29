### Program Flow - Java Classes

1. When the form at login.jsp is filled in and submitted. The AuthServlet object, which should have already been instantiated into existence by the web container, will attend to the request. 

2. In AuthServlet, the HttpSession object is retrived from the HttpServletRequest object and the value for attribute "action" is retrived. The value for the "action" attribute allows the servlet to ascertain what to do.

	- The sole member of the AuthServlet object is an instance of a AuthBean class. It is connected to the datasource where user accounts are stored. An instance of the AuthBean class will be injected into the object variable "abean" in the AuthServlet object. 

	- The AuthBean object contains most of the business logic of the web application. They include the ability to verify if a user is logged in, the validating of a user that is attempting to log in, and the updating of a user's status. 
	
3. In the event when a user is trying to login. Credentials are retrived from the HttpServletRequest object and validated by abean:

	- If the user has already been logged in, he will be redirected back to login.jsp. And the fact that he is logged in will be indicated to him. 

	- If the password is wrong, the user will be redirected back to login.jsp where error messages will be displayed.

	- And if the login is successful. He will be redirected to home.jsp.

4. In the event when a user is trying to logout. The user's status is updated and the session is destroyed with the invalidate() method. The user is then redirected to the login.jsp where he can login again if he want to.  


