package Upload;

import com.google.gson.annotations.SerializedName;

public class Synonyms {

    @SerializedName("word")
    private String word;
    @SerializedName("score")
    private int score;

    public String getWord() {
        return word;
    }

    public int getScore() {
        return score;
    }

}
