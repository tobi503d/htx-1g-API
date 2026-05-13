import http.requests.*;
boolean updateViaApi = false;
String apiUrl = null;
String ApiWord = null;
String apiKey = "Your API ninjas key";
JSONArray jsonDataArray = null;
import java.util.Map; //For viewData()
HashMap<String, Float> dataHM = new HashMap<String, Float>();

void setup() {
    ApiWord = "Wall";
    if (ApiWord == null) {
        println("\n No word");
        // return; // Stop, if no word is chosen
    } else {
        if (updateViaApi) {
            background(255, 0, 0); //Using montly calls
        } else {
            background(0, 255, 44); //No probs
        }
        fetchData();
        extractData();
        viewData();
    }
}
void draw() {
}

void fetchData() {
    if (updateViaApi) {
        if (ApiWord == null) {
            println("\n No word");
            //return; //Stop, if no word is chosen
        } else {
            apiUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/" + ApiWord;
            GetRequest get = new GetRequest(apiUrl);
            get.addHeader("X-Api-Key", apiKey);
            get.send();
            jsonDataArray = parseJSONArray("[" + get.getContent() + "]");
        }
    }
}

//Fix output later
void viewData() {
    println("wORD: \t" + ApiWord);
    //print(me.getKey() + " is : \t");
    //println(me.getValue());
}


void extractData() {
    if (jsonDataArray == null) {
        println("\n JSONArray could not be parsed");
    } else {
        
        //while() {
        //number=array       then turn to objekt         meanings=array     then turn to objekt         number=array       then turn to objekt          definitions=array       then turn to objekt         number=array       then turn to objekt          then dataHM.put("Definition", jsonDataArray.getString("definition"));
            //dataHM.put("Definition", jsonDataArray.getString("definition"));
            
        //}
    }
}


