public class JSONPlaceholderExercise {
    private static final String BASE_URL = 'https://jsonplaceholder.typicode.com';
    private static final Integer TIMEOUT = 10000;
    
    /**
     * Exercise 1: Implement a GET request to fetch a post by ID
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to fetch
     * @return String - The JSON response from the API
     */
    public static String getPostById(Integer postId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'GET'
        // 4. Send the request and get the response
        // 5. Return the response body as string
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts/' + postId);
        req.setMethod('GET');
        req.setTimeout(TIMEOUT);
        try {
            HttpResponse res = new Http().send(req);
            if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
                throw new CalloutException('GET failed with status: ' + res.getStatusCode() + ' ' + res.getStatus());
            }
            return res.getBody();
        } catch (CalloutException e) {
            System.debug('getPostById error: ' + e.getMessage());
            throw e;
        }
    }
    
    /**
     * Exercise 2: Implement a POST request to create a new post
     * Endpoint: /posts
     * @param title - The title of the post
     * @param body - The body content of the post
     * @param userId - The user ID creating the post
     * @return String - The JSON response from the API
     */
    public static String createPost(String title, String body, Integer userId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts'
        // 3. Set the HTTP method to 'POST'
        // 4. Create a JSON string with the post data
        // 5. Set the request body
        // 6. Send the request and get the response
        // 7. Return the response body as string
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(TIMEOUT);
        String jsonBody = JSON.serialize(new Map<String, Object>{
                'title' => title,
                'body' => body,
                'userId' => userId
            });
        req.setBody(jsonBody);

        try {
            HttpResponse res = new Http().send(req);
            if (res.getStatusCode() != 201) {
                 throw new PostCreationException('POST failed with status: ' + res.getStatusCode() + ' ' + res.getStatus());
            }

            return res.getBody();

        } catch (CalloutException e) {
            throw new PostCreationException('Error during POST request: ' + e.getMessage());
        }

        
    }
    
    /**
     * Exercise 3: Implement a PUT request to update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to update
     * @param title - The new title
     * @param body - The new body content
     * @param userId - The user ID
     * @return String - The JSON response from the API
     */
    public static String updatePost(Integer postId, String title, String body, Integer userId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'PUT'
        // 4. Create a JSON string with the updated post data
        // 5. Set the request body
        // 6. Send the request and get the response
        // 7. Return the response body as string
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts/' + postId);
        req.setMethod('PUT');
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(TIMEOUT);
        String jsonBody = JSON.serialize(new Map<String, Object>{
            'id' => postId,
            'title' => title,
            'body' => body,
            'userId' => userId
        });
        req.setBody(jsonBody);
        try {
            HttpResponse res = new Http().send(req);
            if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
                throw new CalloutException('PUT failed with status: ' + res.getStatusCode() + ' ' + res.getStatus());
            }
            return res.getBody();
        } catch (CalloutException e) {
            System.debug('updatePost error: ' + e.getMessage());
            throw e;
        }
    }
    
    /**
     * Exercise 4: Implement a PATCH request to partially update a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to patch
     * @param title - The new title (can be null)
     * @return String - The JSON response from the API
     */
    public static String patchPostTitle(Integer postId, String title) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'PATCH'
        // 4. Create a JSON string with only the title
        // 5. Set the request body
        // 6. Send the request and get the response
        // 7. Return the response body as string
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts/' + postId);
        req.setMethod('PATCH');
        req.setHeader('Content-Type', 'application/json');
        req.setTimeout(TIMEOUT);
        String jsonBody = JSON.serialize(new Map<String, Object>{
            'title' => title
        });
        req.setBody(jsonBody);
        try {
            HttpResponse res = new Http().send(req);
            if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
                throw new CalloutException('PATCH failed with status: ' + res.getStatusCode() + ' ' + res.getStatus());
            }
            return res.getBody();
        } catch (CalloutException e) {
            System.debug('patchPostTitle error: ' + e.getMessage());
            throw e;
        }
    }
    
    /**
     * Exercise 5: Implement a DELETE request to remove a post
     * Endpoint: /posts/{postId}
     * @param postId - The ID of the post to delete
     * @return Integer - The HTTP status code from the response
     */
    public static Integer deletePost(Integer postId) {
        // TODO: Student Implementation
        // 1. Create a new HTTP request
        // 2. Set the endpoint URL using BASE_URL + '/posts/' + postId
        // 3. Set the HTTP method to 'DELETE'
        // 4. Send the request and get the response
        // 5. Return the response status code
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + '/posts/' + postId);
        req.setMethod('DELETE');
        req.setTimeout(TIMEOUT);
        try {
            HttpResponse res = new Http().send(req);
            if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
                throw new CalloutException('DELETE failed with status: ' + res.getStatusCode() + ' ' + res.getStatus());
            }
            return res.getStatusCode();
        } catch (CalloutException e) {
            System.debug('deletePost error: ' + e.getMessage());
            throw e;
        }
    }
    /**
     * Bulk operations for multiple posts creation 
     * @param posts - List of PostRequest objects containing title, body, and userId
     * @return List<String> - List of JSON responses from the API for each post creation
     */
    public static List<String> createPosts(List<PostRequest> posts) {
        List<String> results = new List<String>();
        for (PostRequest post : posts) {
            results.add(createPost(post.title, post.body, post.userId));
        }
        return results;
    }
    public class PostRequest {
        public String title;
        public String body;
        public Integer userId;

        public PostRequest(String title, String body, Integer userId) {
            this.title = title;
            this.body = body;
            this.userId = userId;
        }
    
    }


    public class PostCreationException extends Exception {}
}