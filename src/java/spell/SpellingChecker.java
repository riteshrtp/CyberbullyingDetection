/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package spell;

/**
 *
 */
public interface SpellingChecker {
     public boolean loadDictionary(String fileName);
    
    /**
     * Check the document for misspelled words
     *
     * @return A list of misspelled words and
     *         the line numbers where they occur.
     * @throws IllegalArgumentException if filename is null
     */



    public String checkDocument(String fileName);

}
    

