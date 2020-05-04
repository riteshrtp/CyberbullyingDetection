/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package data;
import java.io.*;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.*;
import com.swabunga.spell.engine.SpellDictionaryHashMap;
import com.swabunga.spell.engine.Word;
import com.swabunga.spell.event.SpellCheckEvent;
import com.swabunga.spell.event.SpellCheckListener;
import com.swabunga.spell.event.SpellChecker;
import com.swabunga.spell.event.StringWordTokenizer;
import com.swabunga.spell.event.TeXWordFinder;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Scanner;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 *
 */
public class JazzySpellChecker implements SpellCheckListener {
     private SpellChecker spellChecker;
      private Dictionary dict1;
    public static  File dict = new File("C:\\Users\\prsm\\Desktop\\find.txt");
       final static String filePath="C:\\Users\\prsm\\Desktop\\find.txt"; 
 private List<String> misspelledWords;

 public List<String> getMisspelledWords(String text) {
  StringWordTokenizer texTok = new StringWordTokenizer(text,
    new TeXWordFinder());
  spellChecker.checkSpelling(texTok);
  return misspelledWords;
  
 }
  private static SpellDictionaryHashMap dictionaryHashMap;
static{
  
  
  try {
   dictionaryHashMap = new SpellDictionaryHashMap(dict);
  } catch (FileNotFoundException e) {
   e.printStackTrace();
  } catch (IOException e) {
   e.printStackTrace();
  }
 }
  
 private void initialize(){
     
   spellChecker = new SpellChecker(dictionaryHashMap);
   spellChecker.addSpellCheckListener(this);  
    

 }
  
  
 public JazzySpellChecker() throws FileNotFoundException {
     


  misspelledWords = new ArrayList<String>();
  initialize();
  dict1 = new Dictionary();
        dict1.build(filePath);
 }
 public boolean getCorrectedLine(String line) throws FileNotFoundException, IOException{
     boolean f;



   {
    ArrayList<String> line1=new ArrayList<>();
     
  List<String> misSpelledWords = getMisspelledWords(line);
   
  for (String misSpelledWord : misSpelledWords){
   List<String> suggestions = getSuggestions(misSpelledWord);
   if (suggestions.size() == 0)
    continue;
   for(int i=0;i<suggestions.size();i++)
   {
   String bestSuggestion = suggestions.get(i);
   line = line.replace(misSpelledWord, bestSuggestion);
   line1.add(line);
  }
   System.out.println("best Sugesstionssssssssssssss"+line1);
   System.out.println("sugesstion size is========"+line1.size());
  }
  if(line1.size()>0)
  {
      f=true;
  }
  else
  {
      f=false;
  }
   }
    
  return f;
 }
  public boolean search(String line) throws FileNotFoundException, IOException
  {
      int count=0;
      BufferedReader br=new BufferedReader(new FileReader("C:\\Users\\prsm\\Desktop\\find.txt"));
    
String currentLine;

while((currentLine = br.readLine()) != null)
{
    if(currentLine.equalsIgnoreCase(line))
    {
        System.out.println("existed");
       count++;
        break;
    }
    else
    {
       count=0;
    }
}
if(count>0)
{
    return true;
}
else
{
    return false;
}
      
  }
      
  
 public String getCorrectedText(String line){
  StringBuilder builder = new StringBuilder();
  String[] tempWords = line.split(" ");
  for (String tempWord : tempWords){
   if (!spellChecker.isCorrect(tempWord)){
    List<Word> suggestions = spellChecker.getSuggestions(tempWord, 0);
    if (suggestions.size() > 0){
     builder.append(spellChecker.getSuggestions(tempWord, 0).get(0).toString());
    }
    else
     builder.append(tempWord);
   }
   else {
    builder.append(tempWord);
   }
   builder.append(" ");
  }
  return builder.toString().trim();
 }
  
  
 public List<String> getSuggestions(String misspelledWord){
   
  @SuppressWarnings("unchecked")
  List<Word> su99esti0ns = spellChecker.getSuggestions(misspelledWord, 0);
  List<String> suggestions = new ArrayList<String>();
  for (Word suggestion : su99esti0ns){
   suggestions.add(suggestion.getWord());
  }
   
  return suggestions;
 }
 
  
 @Override
 public void spellingError(SpellCheckEvent event) {
  event.ignoreWord(true);
  misspelledWords.add(event.getInvalidWord());
 }

 
 public static void main(String[] args) throws IOException {
  JazzySpellChecker jazzySpellChecker = new JazzySpellChecker();
  String line="";
  System.out.println("enter the word:");
  BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
  String str=br.readLine();
  StringTokenizer str1=new StringTokenizer(str," ");
  while(str1.hasMoreTokens())
  {
    String word=str1.nextToken();
    Pattern p = Pattern.compile("[^A-Za-z0-9]");
     Matcher m = p.matcher(word);
    // boolean b = m.matches();
     boolean b = m.find();
     if (b == true)
     {
  String input=str.replaceAll("[-+_.^:~@#$%*0-9]", "");
boolean   line2 = jazzySpellChecker.getCorrectedLine(input);

if(line2)
{
  System.out.println(word+"is bullying word");
}
else
{
    System.out.println(word+"its not a buylling word");
  
 }
boolean l4=jazzySpellChecker.search(word);
if(l4)
{
    System.out.println("it is bullying wordddddd"+word);
}
else
{
    
    System.out.println("it is not a bullying wordddddd"+word);


}

  }
     else
             {
                 boolean   line2 = jazzySpellChecker.search(str);
                 if(line2)
                 {
                     System.out.println("it is bullying wordddddd"+word);
                 }
                 else
                 {
                     System.out.println("not a bullying");
                 }
             }
 }
 }
}
 
    

