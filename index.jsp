<%@ page import="java.util.*, yourpackage.Post" %>
<html>
<head>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav class="navbar"> <h2>Instagram</h2> </nav>

    <div class="main-container">
        <form action="index.jsp" method="POST" class="upload-form">
            <input type="text" name="user" placeholder="Username" required>
            <input type="text" name="url" placeholder="Image Link (URL)" required>
            <textarea name="cap" placeholder="Caption"></textarea>
            <button type="submit">Post Now</button>
        </form>

        <div class="feed">
            <% 
                // Temporary List (Database-er bodle)
                List<Post> posts = (List<Post>) application.getAttribute("postList");
                if(posts == null) posts = new ArrayList<>();

                // Nothun Post Add kora
                String user = request.getParameter("user");
                if(user != null) {
                    posts.add(new Post(user, request.getParameter("url"), request.getParameter("cap")));
                    application.setAttribute("postList", posts);
                }

                // Reverse Loop (Latest post upore thakbe)
                for(int i = posts.size()-1; i>=0; i--) {
                    Post p = posts.get(i);
            %>
                <div class="post">
                    <div class="header"><strong><%= p.getUsername() %></strong></div>
                    <img src="<%= p.getImageUrl() %>" width="100%">
                    <div class="footer"><%= p.getCaption() %></div>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>
