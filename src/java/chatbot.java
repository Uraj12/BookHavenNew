import com.projectx.Books.Repository.chatbotrepository;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class chatbot
 */
public class chatbot extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String userMessage = request.getParameter("message");

            // Check if the user message is empty or null
            if (userMessage == null || userMessage.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Message parameter is missing or empty");
                return;
            }

            // Initialize the repository to get chatbot's response
            chatbotrepository repository = new chatbotrepository();

            // Get response from the repository based on user message
            String chatbotResponse = repository.getResponse(userMessage);

            // Create a JSON response
            String jsonResponse = "{\"response\": \"" + chatbotResponse + "\"}";
            out.write(jsonResponse);
            
        } catch (Exception e) {
            e.printStackTrace(); // Log the error for debugging
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
