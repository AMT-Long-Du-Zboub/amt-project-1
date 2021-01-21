package stackoverflow;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

public class ConnectionAPI {
    @Resource(lookup = "gamification/event")
    static String gamificationEventURL;

    @Resource(lookup = "gamification/users/")
    static String gamificationUsersURL;

    @Resource(lookup = "gamification/apikey")
    static String gamificationAPIKey;

    public static void post(String type, String userId) {
        try {
            URL url = new URL(gamificationEventURL);
            String jsonFormat = "{" +
                "\"properties\": {}," +
                "\"timestamp\": %s," +
                "\"type\": %s," +
                "\"userId\": %s" +
            " }";
            String timestamp = java.time.Clock.systemUTC().instant().toString();

            HttpURLConnection postConnection = (HttpURLConnection) url.openConnection();
            postConnection.setRequestMethod("POST");
            postConnection.setRequestProperty("x-api-key", gamificationAPIKey);
            postConnection.setRequestProperty("Content-Type", "application/json");
            postConnection.setDoOutput(true);

            OutputStream os = postConnection.getOutputStream();
            os.write(String.format(jsonFormat, type,timestamp, userId).getBytes());
            os.flush();
            os.close();
        }
        catch (ProtocolException e) {
            e.printStackTrace();
        }
        catch (MalformedURLException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Object getUser(String userId) {
        try {
            URL url = new URL(gamificationUsersURL + userId);

            HttpURLConnection getConnection = (HttpURLConnection) url.openConnection();
            getConnection.setRequestMethod("GET");
            getConnection.setRequestProperty("x-api-key", gamificationAPIKey);
            getConnection.setRequestProperty("Content-Type", "application/json");
            getConnection.setDoOutput(true);

            return getConnection.getContent();
        }
        catch (ProtocolException e) {
            e.printStackTrace();
        }
        catch (MalformedURLException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Object getTop10() {
        try {
            URL url = new URL(gamificationUsersURL + "top10bypoint");

            HttpURLConnection getConnection = (HttpURLConnection) url.openConnection();
            getConnection.setRequestMethod("GET");
            getConnection.setRequestProperty("x-api-key", gamificationAPIKey);
            getConnection.setRequestProperty("Content-Type", "application/json");
            getConnection.setDoOutput(true);

            return getConnection.getContent();
        }
        catch (ProtocolException e) {
            e.printStackTrace();
        }
        catch (MalformedURLException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
