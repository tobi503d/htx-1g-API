import http.requests.*;

boolean updateViaApi = true; // Always fetch live, no file fallback
String apiUrl = null;
String ApiWord = null;
String apiKey = "";
JSONArray jsonDataArray = null;
import java.util.Map;
HashMap<String, Float> dataHM = new HashMap<String, Float>();
int[] requestTimeStamp;

void setup() {
    ApiWord = "Wall";
    requestTimeStamp = new int[6];
    
    if (ApiWord == null) {
        println("\nNo word");
    } else {
        background(0, 255, 255);
        fetchData();
        extractData();
        viewData();
    }
}

void draw() {}

void fetchData() {
    if (ApiWord == null) {
        println("\nNo word");
        return;
    }
    
    apiUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/" + ApiWord;
    GetRequest get = new GetRequest(apiUrl);
    get.addHeader("X-Api-Key", apiKey);
    get.send();
}

void extractData() {
    if (jsonDataArray == null) {
        println("\nJSONArray could not be parsed");
        return;
    }
    //Make it loop until no more definitions
    JSONObject jsonDataDefinition = jsonDataArray.getJSONObject("definition");
    dataHM.put("Definition", jsonDataDefinition.getString("definition"));
    
    
    JSONObject meta = jsonDataArray.getJSONObject(1);
    ApiWord            = meta.getString("cityName");
    requestTimeStamp[0] = meta.getInt("Request Day");
    requestTimeStamp[1] = meta.getInt("Request Month");
    requestTimeStamp[2] = meta.getInt("Request Year");
    requestTimeStamp[3] = meta.getInt("Request Hour");
    requestTimeStamp[4] = meta.getInt("Request Minute");
    requestTimeStamp[5] = meta.getInt("Request Seconds");
}

void viewData() {
    println("City name: \t" + ApiWord);
    println("Data from: \t" + requestTimeStamp[0] + "/" + requestTimeStamp[1]
        + "-" + requestTimeStamp[2] + " " + requestTimeStamp[3]
        + ":" + requestTimeStamp[4] + ":" + requestTimeStamp[5]);
    for (Map.Entry me : dataHM.entrySet()) {
        print(me.getKey() + " is: \t");
        println(me.getValue());
    }
}