package fr.n7.parser.antlr.internal;

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import fr.n7.services.PDL2GrammarAccess;



import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class InternalPDL2Parser extends AbstractInternalAntlrParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "RULE_ID", "RULE_STRING", "RULE_INT", "RULE_ML_COMMENT", "RULE_SL_COMMENT", "RULE_WS", "RULE_ANY_OTHER", "'process'", "'{'", "'}'", "'wd'", "'starts'", "'if'", "'finishes'", "'started'", "'finished'", "'note'"
    };
    public static final int RULE_STRING=5;
    public static final int RULE_SL_COMMENT=8;
    public static final int T__19=19;
    public static final int T__15=15;
    public static final int T__16=16;
    public static final int T__17=17;
    public static final int T__18=18;
    public static final int T__11=11;
    public static final int T__12=12;
    public static final int T__13=13;
    public static final int T__14=14;
    public static final int EOF=-1;
    public static final int RULE_ID=4;
    public static final int RULE_WS=9;
    public static final int RULE_ANY_OTHER=10;
    public static final int RULE_INT=6;
    public static final int RULE_ML_COMMENT=7;
    public static final int T__20=20;

    // delegates
    // delegators


        public InternalPDL2Parser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public InternalPDL2Parser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        

    public String[] getTokenNames() { return InternalPDL2Parser.tokenNames; }
    public String getGrammarFileName() { return "InternalPDL2.g"; }



     	private PDL2GrammarAccess grammarAccess;

        public InternalPDL2Parser(TokenStream input, PDL2GrammarAccess grammarAccess) {
            this(input);
            this.grammarAccess = grammarAccess;
            registerRules(grammarAccess.getGrammar());
        }

        @Override
        protected String getFirstRuleName() {
        	return "Process";
       	}

       	@Override
       	protected PDL2GrammarAccess getGrammarAccess() {
       		return grammarAccess;
       	}




    // $ANTLR start "entryRuleProcess"
    // InternalPDL2.g:64:1: entryRuleProcess returns [EObject current=null] : iv_ruleProcess= ruleProcess EOF ;
    public final EObject entryRuleProcess() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleProcess = null;


        try {
            // InternalPDL2.g:64:48: (iv_ruleProcess= ruleProcess EOF )
            // InternalPDL2.g:65:2: iv_ruleProcess= ruleProcess EOF
            {
             newCompositeNode(grammarAccess.getProcessRule()); 
            pushFollow(FOLLOW_1);
            iv_ruleProcess=ruleProcess();

            state._fsp--;

             current =iv_ruleProcess; 
            match(input,EOF,FOLLOW_2); 

            }

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleProcess"


    // $ANTLR start "ruleProcess"
    // InternalPDL2.g:71:1: ruleProcess returns [EObject current=null] : (otherlv_0= 'process' ( (lv_name_1_0= RULE_ID ) ) otherlv_2= '{' ( (lv_processElements_3_0= ruleProcessElement ) )* otherlv_4= '}' ) ;
    public final EObject ruleProcess() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        Token lv_name_1_0=null;
        Token otherlv_2=null;
        Token otherlv_4=null;
        EObject lv_processElements_3_0 = null;



        	enterRule();

        try {
            // InternalPDL2.g:77:2: ( (otherlv_0= 'process' ( (lv_name_1_0= RULE_ID ) ) otherlv_2= '{' ( (lv_processElements_3_0= ruleProcessElement ) )* otherlv_4= '}' ) )
            // InternalPDL2.g:78:2: (otherlv_0= 'process' ( (lv_name_1_0= RULE_ID ) ) otherlv_2= '{' ( (lv_processElements_3_0= ruleProcessElement ) )* otherlv_4= '}' )
            {
            // InternalPDL2.g:78:2: (otherlv_0= 'process' ( (lv_name_1_0= RULE_ID ) ) otherlv_2= '{' ( (lv_processElements_3_0= ruleProcessElement ) )* otherlv_4= '}' )
            // InternalPDL2.g:79:3: otherlv_0= 'process' ( (lv_name_1_0= RULE_ID ) ) otherlv_2= '{' ( (lv_processElements_3_0= ruleProcessElement ) )* otherlv_4= '}'
            {
            otherlv_0=(Token)match(input,11,FOLLOW_3); 

            			newLeafNode(otherlv_0, grammarAccess.getProcessAccess().getProcessKeyword_0());
            		
            // InternalPDL2.g:83:3: ( (lv_name_1_0= RULE_ID ) )
            // InternalPDL2.g:84:4: (lv_name_1_0= RULE_ID )
            {
            // InternalPDL2.g:84:4: (lv_name_1_0= RULE_ID )
            // InternalPDL2.g:85:5: lv_name_1_0= RULE_ID
            {
            lv_name_1_0=(Token)match(input,RULE_ID,FOLLOW_4); 

            					newLeafNode(lv_name_1_0, grammarAccess.getProcessAccess().getNameIDTerminalRuleCall_1_0());
            				

            					if (current==null) {
            						current = createModelElement(grammarAccess.getProcessRule());
            					}
            					setWithLastConsumed(
            						current,
            						"name",
            						lv_name_1_0,
            						"org.eclipse.xtext.common.Terminals.ID");
            				

            }


            }

            otherlv_2=(Token)match(input,12,FOLLOW_5); 

            			newLeafNode(otherlv_2, grammarAccess.getProcessAccess().getLeftCurlyBracketKeyword_2());
            		
            // InternalPDL2.g:105:3: ( (lv_processElements_3_0= ruleProcessElement ) )*
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( (LA1_0==14||LA1_0==20) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // InternalPDL2.g:106:4: (lv_processElements_3_0= ruleProcessElement )
            	    {
            	    // InternalPDL2.g:106:4: (lv_processElements_3_0= ruleProcessElement )
            	    // InternalPDL2.g:107:5: lv_processElements_3_0= ruleProcessElement
            	    {

            	    					newCompositeNode(grammarAccess.getProcessAccess().getProcessElementsProcessElementParserRuleCall_3_0());
            	    				
            	    pushFollow(FOLLOW_5);
            	    lv_processElements_3_0=ruleProcessElement();

            	    state._fsp--;


            	    					if (current==null) {
            	    						current = createModelElementForParent(grammarAccess.getProcessRule());
            	    					}
            	    					add(
            	    						current,
            	    						"processElements",
            	    						lv_processElements_3_0,
            	    						"fr.n7.PDL2.ProcessElement");
            	    					afterParserOrEnumRuleCall();
            	    				

            	    }


            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);

            otherlv_4=(Token)match(input,13,FOLLOW_2); 

            			newLeafNode(otherlv_4, grammarAccess.getProcessAccess().getRightCurlyBracketKeyword_4());
            		

            }


            }


            	leaveRule();

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleProcess"


    // $ANTLR start "entryRuleProcessElement"
    // InternalPDL2.g:132:1: entryRuleProcessElement returns [EObject current=null] : iv_ruleProcessElement= ruleProcessElement EOF ;
    public final EObject entryRuleProcessElement() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleProcessElement = null;


        try {
            // InternalPDL2.g:132:55: (iv_ruleProcessElement= ruleProcessElement EOF )
            // InternalPDL2.g:133:2: iv_ruleProcessElement= ruleProcessElement EOF
            {
             newCompositeNode(grammarAccess.getProcessElementRule()); 
            pushFollow(FOLLOW_1);
            iv_ruleProcessElement=ruleProcessElement();

            state._fsp--;

             current =iv_ruleProcessElement; 
            match(input,EOF,FOLLOW_2); 

            }

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleProcessElement"


    // $ANTLR start "ruleProcessElement"
    // InternalPDL2.g:139:1: ruleProcessElement returns [EObject current=null] : (this_WorkDefinition_0= ruleWorkDefinition | this_Guidance_1= ruleGuidance ) ;
    public final EObject ruleProcessElement() throws RecognitionException {
        EObject current = null;

        EObject this_WorkDefinition_0 = null;

        EObject this_Guidance_1 = null;



        	enterRule();

        try {
            // InternalPDL2.g:145:2: ( (this_WorkDefinition_0= ruleWorkDefinition | this_Guidance_1= ruleGuidance ) )
            // InternalPDL2.g:146:2: (this_WorkDefinition_0= ruleWorkDefinition | this_Guidance_1= ruleGuidance )
            {
            // InternalPDL2.g:146:2: (this_WorkDefinition_0= ruleWorkDefinition | this_Guidance_1= ruleGuidance )
            int alt2=2;
            int LA2_0 = input.LA(1);

            if ( (LA2_0==14) ) {
                alt2=1;
            }
            else if ( (LA2_0==20) ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // InternalPDL2.g:147:3: this_WorkDefinition_0= ruleWorkDefinition
                    {

                    			newCompositeNode(grammarAccess.getProcessElementAccess().getWorkDefinitionParserRuleCall_0());
                    		
                    pushFollow(FOLLOW_2);
                    this_WorkDefinition_0=ruleWorkDefinition();

                    state._fsp--;


                    			current = this_WorkDefinition_0;
                    			afterParserOrEnumRuleCall();
                    		

                    }
                    break;
                case 2 :
                    // InternalPDL2.g:156:3: this_Guidance_1= ruleGuidance
                    {

                    			newCompositeNode(grammarAccess.getProcessElementAccess().getGuidanceParserRuleCall_1());
                    		
                    pushFollow(FOLLOW_2);
                    this_Guidance_1=ruleGuidance();

                    state._fsp--;


                    			current = this_Guidance_1;
                    			afterParserOrEnumRuleCall();
                    		

                    }
                    break;

            }


            }


            	leaveRule();

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleProcessElement"


    // $ANTLR start "entryRuleWorkDefinition"
    // InternalPDL2.g:168:1: entryRuleWorkDefinition returns [EObject current=null] : iv_ruleWorkDefinition= ruleWorkDefinition EOF ;
    public final EObject entryRuleWorkDefinition() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleWorkDefinition = null;


        try {
            // InternalPDL2.g:168:55: (iv_ruleWorkDefinition= ruleWorkDefinition EOF )
            // InternalPDL2.g:169:2: iv_ruleWorkDefinition= ruleWorkDefinition EOF
            {
             newCompositeNode(grammarAccess.getWorkDefinitionRule()); 
            pushFollow(FOLLOW_1);
            iv_ruleWorkDefinition=ruleWorkDefinition();

            state._fsp--;

             current =iv_ruleWorkDefinition; 
            match(input,EOF,FOLLOW_2); 

            }

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleWorkDefinition"


    // $ANTLR start "ruleWorkDefinition"
    // InternalPDL2.g:175:1: ruleWorkDefinition returns [EObject current=null] : (otherlv_0= 'wd' ( (lv_name_1_0= RULE_ID ) ) otherlv_2= '{' (otherlv_3= 'starts' otherlv_4= 'if' ( (lv_linksToPredecessors_5_0= ruleDependanceStart ) )+ )? (otherlv_6= 'finishes' otherlv_7= 'if' ( (lv_linksToPredecessors_8_0= ruleDependanceFinish ) )+ )? otherlv_9= '}' ) ;
    public final EObject ruleWorkDefinition() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        Token lv_name_1_0=null;
        Token otherlv_2=null;
        Token otherlv_3=null;
        Token otherlv_4=null;
        Token otherlv_6=null;
        Token otherlv_7=null;
        Token otherlv_9=null;
        EObject lv_linksToPredecessors_5_0 = null;

        EObject lv_linksToPredecessors_8_0 = null;



        	enterRule();

        try {
            // InternalPDL2.g:181:2: ( (otherlv_0= 'wd' ( (lv_name_1_0= RULE_ID ) ) otherlv_2= '{' (otherlv_3= 'starts' otherlv_4= 'if' ( (lv_linksToPredecessors_5_0= ruleDependanceStart ) )+ )? (otherlv_6= 'finishes' otherlv_7= 'if' ( (lv_linksToPredecessors_8_0= ruleDependanceFinish ) )+ )? otherlv_9= '}' ) )
            // InternalPDL2.g:182:2: (otherlv_0= 'wd' ( (lv_name_1_0= RULE_ID ) ) otherlv_2= '{' (otherlv_3= 'starts' otherlv_4= 'if' ( (lv_linksToPredecessors_5_0= ruleDependanceStart ) )+ )? (otherlv_6= 'finishes' otherlv_7= 'if' ( (lv_linksToPredecessors_8_0= ruleDependanceFinish ) )+ )? otherlv_9= '}' )
            {
            // InternalPDL2.g:182:2: (otherlv_0= 'wd' ( (lv_name_1_0= RULE_ID ) ) otherlv_2= '{' (otherlv_3= 'starts' otherlv_4= 'if' ( (lv_linksToPredecessors_5_0= ruleDependanceStart ) )+ )? (otherlv_6= 'finishes' otherlv_7= 'if' ( (lv_linksToPredecessors_8_0= ruleDependanceFinish ) )+ )? otherlv_9= '}' )
            // InternalPDL2.g:183:3: otherlv_0= 'wd' ( (lv_name_1_0= RULE_ID ) ) otherlv_2= '{' (otherlv_3= 'starts' otherlv_4= 'if' ( (lv_linksToPredecessors_5_0= ruleDependanceStart ) )+ )? (otherlv_6= 'finishes' otherlv_7= 'if' ( (lv_linksToPredecessors_8_0= ruleDependanceFinish ) )+ )? otherlv_9= '}'
            {
            otherlv_0=(Token)match(input,14,FOLLOW_3); 

            			newLeafNode(otherlv_0, grammarAccess.getWorkDefinitionAccess().getWdKeyword_0());
            		
            // InternalPDL2.g:187:3: ( (lv_name_1_0= RULE_ID ) )
            // InternalPDL2.g:188:4: (lv_name_1_0= RULE_ID )
            {
            // InternalPDL2.g:188:4: (lv_name_1_0= RULE_ID )
            // InternalPDL2.g:189:5: lv_name_1_0= RULE_ID
            {
            lv_name_1_0=(Token)match(input,RULE_ID,FOLLOW_4); 

            					newLeafNode(lv_name_1_0, grammarAccess.getWorkDefinitionAccess().getNameIDTerminalRuleCall_1_0());
            				

            					if (current==null) {
            						current = createModelElement(grammarAccess.getWorkDefinitionRule());
            					}
            					setWithLastConsumed(
            						current,
            						"name",
            						lv_name_1_0,
            						"org.eclipse.xtext.common.Terminals.ID");
            				

            }


            }

            otherlv_2=(Token)match(input,12,FOLLOW_6); 

            			newLeafNode(otherlv_2, grammarAccess.getWorkDefinitionAccess().getLeftCurlyBracketKeyword_2());
            		
            // InternalPDL2.g:209:3: (otherlv_3= 'starts' otherlv_4= 'if' ( (lv_linksToPredecessors_5_0= ruleDependanceStart ) )+ )?
            int alt4=2;
            int LA4_0 = input.LA(1);

            if ( (LA4_0==15) ) {
                alt4=1;
            }
            switch (alt4) {
                case 1 :
                    // InternalPDL2.g:210:4: otherlv_3= 'starts' otherlv_4= 'if' ( (lv_linksToPredecessors_5_0= ruleDependanceStart ) )+
                    {
                    otherlv_3=(Token)match(input,15,FOLLOW_7); 

                    				newLeafNode(otherlv_3, grammarAccess.getWorkDefinitionAccess().getStartsKeyword_3_0());
                    			
                    otherlv_4=(Token)match(input,16,FOLLOW_3); 

                    				newLeafNode(otherlv_4, grammarAccess.getWorkDefinitionAccess().getIfKeyword_3_1());
                    			
                    // InternalPDL2.g:218:4: ( (lv_linksToPredecessors_5_0= ruleDependanceStart ) )+
                    int cnt3=0;
                    loop3:
                    do {
                        int alt3=2;
                        int LA3_0 = input.LA(1);

                        if ( (LA3_0==RULE_ID) ) {
                            alt3=1;
                        }


                        switch (alt3) {
                    	case 1 :
                    	    // InternalPDL2.g:219:5: (lv_linksToPredecessors_5_0= ruleDependanceStart )
                    	    {
                    	    // InternalPDL2.g:219:5: (lv_linksToPredecessors_5_0= ruleDependanceStart )
                    	    // InternalPDL2.g:220:6: lv_linksToPredecessors_5_0= ruleDependanceStart
                    	    {

                    	    						newCompositeNode(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsDependanceStartParserRuleCall_3_2_0());
                    	    					
                    	    pushFollow(FOLLOW_8);
                    	    lv_linksToPredecessors_5_0=ruleDependanceStart();

                    	    state._fsp--;


                    	    						if (current==null) {
                    	    							current = createModelElementForParent(grammarAccess.getWorkDefinitionRule());
                    	    						}
                    	    						add(
                    	    							current,
                    	    							"linksToPredecessors",
                    	    							lv_linksToPredecessors_5_0,
                    	    							"fr.n7.PDL2.DependanceStart");
                    	    						afterParserOrEnumRuleCall();
                    	    					

                    	    }


                    	    }
                    	    break;

                    	default :
                    	    if ( cnt3 >= 1 ) break loop3;
                                EarlyExitException eee =
                                    new EarlyExitException(3, input);
                                throw eee;
                        }
                        cnt3++;
                    } while (true);


                    }
                    break;

            }

            // InternalPDL2.g:238:3: (otherlv_6= 'finishes' otherlv_7= 'if' ( (lv_linksToPredecessors_8_0= ruleDependanceFinish ) )+ )?
            int alt6=2;
            int LA6_0 = input.LA(1);

            if ( (LA6_0==17) ) {
                alt6=1;
            }
            switch (alt6) {
                case 1 :
                    // InternalPDL2.g:239:4: otherlv_6= 'finishes' otherlv_7= 'if' ( (lv_linksToPredecessors_8_0= ruleDependanceFinish ) )+
                    {
                    otherlv_6=(Token)match(input,17,FOLLOW_7); 

                    				newLeafNode(otherlv_6, grammarAccess.getWorkDefinitionAccess().getFinishesKeyword_4_0());
                    			
                    otherlv_7=(Token)match(input,16,FOLLOW_3); 

                    				newLeafNode(otherlv_7, grammarAccess.getWorkDefinitionAccess().getIfKeyword_4_1());
                    			
                    // InternalPDL2.g:247:4: ( (lv_linksToPredecessors_8_0= ruleDependanceFinish ) )+
                    int cnt5=0;
                    loop5:
                    do {
                        int alt5=2;
                        int LA5_0 = input.LA(1);

                        if ( (LA5_0==RULE_ID) ) {
                            alt5=1;
                        }


                        switch (alt5) {
                    	case 1 :
                    	    // InternalPDL2.g:248:5: (lv_linksToPredecessors_8_0= ruleDependanceFinish )
                    	    {
                    	    // InternalPDL2.g:248:5: (lv_linksToPredecessors_8_0= ruleDependanceFinish )
                    	    // InternalPDL2.g:249:6: lv_linksToPredecessors_8_0= ruleDependanceFinish
                    	    {

                    	    						newCompositeNode(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsDependanceFinishParserRuleCall_4_2_0());
                    	    					
                    	    pushFollow(FOLLOW_9);
                    	    lv_linksToPredecessors_8_0=ruleDependanceFinish();

                    	    state._fsp--;


                    	    						if (current==null) {
                    	    							current = createModelElementForParent(grammarAccess.getWorkDefinitionRule());
                    	    						}
                    	    						add(
                    	    							current,
                    	    							"linksToPredecessors",
                    	    							lv_linksToPredecessors_8_0,
                    	    							"fr.n7.PDL2.DependanceFinish");
                    	    						afterParserOrEnumRuleCall();
                    	    					

                    	    }


                    	    }
                    	    break;

                    	default :
                    	    if ( cnt5 >= 1 ) break loop5;
                                EarlyExitException eee =
                                    new EarlyExitException(5, input);
                                throw eee;
                        }
                        cnt5++;
                    } while (true);


                    }
                    break;

            }

            otherlv_9=(Token)match(input,13,FOLLOW_2); 

            			newLeafNode(otherlv_9, grammarAccess.getWorkDefinitionAccess().getRightCurlyBracketKeyword_5());
            		

            }


            }


            	leaveRule();

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleWorkDefinition"


    // $ANTLR start "entryRuleDependanceStart"
    // InternalPDL2.g:275:1: entryRuleDependanceStart returns [EObject current=null] : iv_ruleDependanceStart= ruleDependanceStart EOF ;
    public final EObject entryRuleDependanceStart() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleDependanceStart = null;


        try {
            // InternalPDL2.g:275:56: (iv_ruleDependanceStart= ruleDependanceStart EOF )
            // InternalPDL2.g:276:2: iv_ruleDependanceStart= ruleDependanceStart EOF
            {
             newCompositeNode(grammarAccess.getDependanceStartRule()); 
            pushFollow(FOLLOW_1);
            iv_ruleDependanceStart=ruleDependanceStart();

            state._fsp--;

             current =iv_ruleDependanceStart; 
            match(input,EOF,FOLLOW_2); 

            }

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleDependanceStart"


    // $ANTLR start "ruleDependanceStart"
    // InternalPDL2.g:282:1: ruleDependanceStart returns [EObject current=null] : ( ( (otherlv_0= RULE_ID ) ) ( (lv_link_1_0= ruleWorkSequenceKindStart ) ) ) ;
    public final EObject ruleDependanceStart() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        EObject lv_link_1_0 = null;



        	enterRule();

        try {
            // InternalPDL2.g:288:2: ( ( ( (otherlv_0= RULE_ID ) ) ( (lv_link_1_0= ruleWorkSequenceKindStart ) ) ) )
            // InternalPDL2.g:289:2: ( ( (otherlv_0= RULE_ID ) ) ( (lv_link_1_0= ruleWorkSequenceKindStart ) ) )
            {
            // InternalPDL2.g:289:2: ( ( (otherlv_0= RULE_ID ) ) ( (lv_link_1_0= ruleWorkSequenceKindStart ) ) )
            // InternalPDL2.g:290:3: ( (otherlv_0= RULE_ID ) ) ( (lv_link_1_0= ruleWorkSequenceKindStart ) )
            {
            // InternalPDL2.g:290:3: ( (otherlv_0= RULE_ID ) )
            // InternalPDL2.g:291:4: (otherlv_0= RULE_ID )
            {
            // InternalPDL2.g:291:4: (otherlv_0= RULE_ID )
            // InternalPDL2.g:292:5: otherlv_0= RULE_ID
            {

            					if (current==null) {
            						current = createModelElement(grammarAccess.getDependanceStartRule());
            					}
            				
            otherlv_0=(Token)match(input,RULE_ID,FOLLOW_10); 

            					newLeafNode(otherlv_0, grammarAccess.getDependanceStartAccess().getPredecessorWorkDefinitionCrossReference_0_0());
            				

            }


            }

            // InternalPDL2.g:303:3: ( (lv_link_1_0= ruleWorkSequenceKindStart ) )
            // InternalPDL2.g:304:4: (lv_link_1_0= ruleWorkSequenceKindStart )
            {
            // InternalPDL2.g:304:4: (lv_link_1_0= ruleWorkSequenceKindStart )
            // InternalPDL2.g:305:5: lv_link_1_0= ruleWorkSequenceKindStart
            {

            					newCompositeNode(grammarAccess.getDependanceStartAccess().getLinkWorkSequenceKindStartParserRuleCall_1_0());
            				
            pushFollow(FOLLOW_2);
            lv_link_1_0=ruleWorkSequenceKindStart();

            state._fsp--;


            					if (current==null) {
            						current = createModelElementForParent(grammarAccess.getDependanceStartRule());
            					}
            					set(
            						current,
            						"link",
            						lv_link_1_0,
            						"fr.n7.PDL2.WorkSequenceKindStart");
            					afterParserOrEnumRuleCall();
            				

            }


            }


            }


            }


            	leaveRule();

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleDependanceStart"


    // $ANTLR start "entryRuleWorkSequenceKindStart"
    // InternalPDL2.g:326:1: entryRuleWorkSequenceKindStart returns [EObject current=null] : iv_ruleWorkSequenceKindStart= ruleWorkSequenceKindStart EOF ;
    public final EObject entryRuleWorkSequenceKindStart() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleWorkSequenceKindStart = null;


        try {
            // InternalPDL2.g:326:62: (iv_ruleWorkSequenceKindStart= ruleWorkSequenceKindStart EOF )
            // InternalPDL2.g:327:2: iv_ruleWorkSequenceKindStart= ruleWorkSequenceKindStart EOF
            {
             newCompositeNode(grammarAccess.getWorkSequenceKindStartRule()); 
            pushFollow(FOLLOW_1);
            iv_ruleWorkSequenceKindStart=ruleWorkSequenceKindStart();

            state._fsp--;

             current =iv_ruleWorkSequenceKindStart; 
            match(input,EOF,FOLLOW_2); 

            }

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleWorkSequenceKindStart"


    // $ANTLR start "ruleWorkSequenceKindStart"
    // InternalPDL2.g:333:1: ruleWorkSequenceKindStart returns [EObject current=null] : ( ( (lv_Started2Start_0_0= 'started' ) ) | ( (lv_Started2Finish_1_0= 'finished' ) ) ) ;
    public final EObject ruleWorkSequenceKindStart() throws RecognitionException {
        EObject current = null;

        Token lv_Started2Start_0_0=null;
        Token lv_Started2Finish_1_0=null;


        	enterRule();

        try {
            // InternalPDL2.g:339:2: ( ( ( (lv_Started2Start_0_0= 'started' ) ) | ( (lv_Started2Finish_1_0= 'finished' ) ) ) )
            // InternalPDL2.g:340:2: ( ( (lv_Started2Start_0_0= 'started' ) ) | ( (lv_Started2Finish_1_0= 'finished' ) ) )
            {
            // InternalPDL2.g:340:2: ( ( (lv_Started2Start_0_0= 'started' ) ) | ( (lv_Started2Finish_1_0= 'finished' ) ) )
            int alt7=2;
            int LA7_0 = input.LA(1);

            if ( (LA7_0==18) ) {
                alt7=1;
            }
            else if ( (LA7_0==19) ) {
                alt7=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 7, 0, input);

                throw nvae;
            }
            switch (alt7) {
                case 1 :
                    // InternalPDL2.g:341:3: ( (lv_Started2Start_0_0= 'started' ) )
                    {
                    // InternalPDL2.g:341:3: ( (lv_Started2Start_0_0= 'started' ) )
                    // InternalPDL2.g:342:4: (lv_Started2Start_0_0= 'started' )
                    {
                    // InternalPDL2.g:342:4: (lv_Started2Start_0_0= 'started' )
                    // InternalPDL2.g:343:5: lv_Started2Start_0_0= 'started'
                    {
                    lv_Started2Start_0_0=(Token)match(input,18,FOLLOW_2); 

                    					newLeafNode(lv_Started2Start_0_0, grammarAccess.getWorkSequenceKindStartAccess().getStarted2StartStartedKeyword_0_0());
                    				

                    					if (current==null) {
                    						current = createModelElement(grammarAccess.getWorkSequenceKindStartRule());
                    					}
                    					setWithLastConsumed(current, "Started2Start", lv_Started2Start_0_0, "started");
                    				

                    }


                    }


                    }
                    break;
                case 2 :
                    // InternalPDL2.g:356:3: ( (lv_Started2Finish_1_0= 'finished' ) )
                    {
                    // InternalPDL2.g:356:3: ( (lv_Started2Finish_1_0= 'finished' ) )
                    // InternalPDL2.g:357:4: (lv_Started2Finish_1_0= 'finished' )
                    {
                    // InternalPDL2.g:357:4: (lv_Started2Finish_1_0= 'finished' )
                    // InternalPDL2.g:358:5: lv_Started2Finish_1_0= 'finished'
                    {
                    lv_Started2Finish_1_0=(Token)match(input,19,FOLLOW_2); 

                    					newLeafNode(lv_Started2Finish_1_0, grammarAccess.getWorkSequenceKindStartAccess().getStarted2FinishFinishedKeyword_1_0());
                    				

                    					if (current==null) {
                    						current = createModelElement(grammarAccess.getWorkSequenceKindStartRule());
                    					}
                    					setWithLastConsumed(current, "Started2Finish", lv_Started2Finish_1_0, "finished");
                    				

                    }


                    }


                    }
                    break;

            }


            }


            	leaveRule();

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleWorkSequenceKindStart"


    // $ANTLR start "entryRuleDependanceFinish"
    // InternalPDL2.g:374:1: entryRuleDependanceFinish returns [EObject current=null] : iv_ruleDependanceFinish= ruleDependanceFinish EOF ;
    public final EObject entryRuleDependanceFinish() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleDependanceFinish = null;


        try {
            // InternalPDL2.g:374:57: (iv_ruleDependanceFinish= ruleDependanceFinish EOF )
            // InternalPDL2.g:375:2: iv_ruleDependanceFinish= ruleDependanceFinish EOF
            {
             newCompositeNode(grammarAccess.getDependanceFinishRule()); 
            pushFollow(FOLLOW_1);
            iv_ruleDependanceFinish=ruleDependanceFinish();

            state._fsp--;

             current =iv_ruleDependanceFinish; 
            match(input,EOF,FOLLOW_2); 

            }

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleDependanceFinish"


    // $ANTLR start "ruleDependanceFinish"
    // InternalPDL2.g:381:1: ruleDependanceFinish returns [EObject current=null] : ( ( (otherlv_0= RULE_ID ) ) ( (lv_link_1_0= ruleWorkSequenceKindFinish ) ) ) ;
    public final EObject ruleDependanceFinish() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        EObject lv_link_1_0 = null;



        	enterRule();

        try {
            // InternalPDL2.g:387:2: ( ( ( (otherlv_0= RULE_ID ) ) ( (lv_link_1_0= ruleWorkSequenceKindFinish ) ) ) )
            // InternalPDL2.g:388:2: ( ( (otherlv_0= RULE_ID ) ) ( (lv_link_1_0= ruleWorkSequenceKindFinish ) ) )
            {
            // InternalPDL2.g:388:2: ( ( (otherlv_0= RULE_ID ) ) ( (lv_link_1_0= ruleWorkSequenceKindFinish ) ) )
            // InternalPDL2.g:389:3: ( (otherlv_0= RULE_ID ) ) ( (lv_link_1_0= ruleWorkSequenceKindFinish ) )
            {
            // InternalPDL2.g:389:3: ( (otherlv_0= RULE_ID ) )
            // InternalPDL2.g:390:4: (otherlv_0= RULE_ID )
            {
            // InternalPDL2.g:390:4: (otherlv_0= RULE_ID )
            // InternalPDL2.g:391:5: otherlv_0= RULE_ID
            {

            					if (current==null) {
            						current = createModelElement(grammarAccess.getDependanceFinishRule());
            					}
            				
            otherlv_0=(Token)match(input,RULE_ID,FOLLOW_10); 

            					newLeafNode(otherlv_0, grammarAccess.getDependanceFinishAccess().getPredecessorWorkDefinitionCrossReference_0_0());
            				

            }


            }

            // InternalPDL2.g:402:3: ( (lv_link_1_0= ruleWorkSequenceKindFinish ) )
            // InternalPDL2.g:403:4: (lv_link_1_0= ruleWorkSequenceKindFinish )
            {
            // InternalPDL2.g:403:4: (lv_link_1_0= ruleWorkSequenceKindFinish )
            // InternalPDL2.g:404:5: lv_link_1_0= ruleWorkSequenceKindFinish
            {

            					newCompositeNode(grammarAccess.getDependanceFinishAccess().getLinkWorkSequenceKindFinishParserRuleCall_1_0());
            				
            pushFollow(FOLLOW_2);
            lv_link_1_0=ruleWorkSequenceKindFinish();

            state._fsp--;


            					if (current==null) {
            						current = createModelElementForParent(grammarAccess.getDependanceFinishRule());
            					}
            					set(
            						current,
            						"link",
            						lv_link_1_0,
            						"fr.n7.PDL2.WorkSequenceKindFinish");
            					afterParserOrEnumRuleCall();
            				

            }


            }


            }


            }


            	leaveRule();

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleDependanceFinish"


    // $ANTLR start "entryRuleWorkSequenceKindFinish"
    // InternalPDL2.g:425:1: entryRuleWorkSequenceKindFinish returns [EObject current=null] : iv_ruleWorkSequenceKindFinish= ruleWorkSequenceKindFinish EOF ;
    public final EObject entryRuleWorkSequenceKindFinish() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleWorkSequenceKindFinish = null;


        try {
            // InternalPDL2.g:425:63: (iv_ruleWorkSequenceKindFinish= ruleWorkSequenceKindFinish EOF )
            // InternalPDL2.g:426:2: iv_ruleWorkSequenceKindFinish= ruleWorkSequenceKindFinish EOF
            {
             newCompositeNode(grammarAccess.getWorkSequenceKindFinishRule()); 
            pushFollow(FOLLOW_1);
            iv_ruleWorkSequenceKindFinish=ruleWorkSequenceKindFinish();

            state._fsp--;

             current =iv_ruleWorkSequenceKindFinish; 
            match(input,EOF,FOLLOW_2); 

            }

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleWorkSequenceKindFinish"


    // $ANTLR start "ruleWorkSequenceKindFinish"
    // InternalPDL2.g:432:1: ruleWorkSequenceKindFinish returns [EObject current=null] : ( ( (lv_Finished2Start_0_0= 'started' ) ) | ( (lv_Finished2Finish_1_0= 'finished' ) ) ) ;
    public final EObject ruleWorkSequenceKindFinish() throws RecognitionException {
        EObject current = null;

        Token lv_Finished2Start_0_0=null;
        Token lv_Finished2Finish_1_0=null;


        	enterRule();

        try {
            // InternalPDL2.g:438:2: ( ( ( (lv_Finished2Start_0_0= 'started' ) ) | ( (lv_Finished2Finish_1_0= 'finished' ) ) ) )
            // InternalPDL2.g:439:2: ( ( (lv_Finished2Start_0_0= 'started' ) ) | ( (lv_Finished2Finish_1_0= 'finished' ) ) )
            {
            // InternalPDL2.g:439:2: ( ( (lv_Finished2Start_0_0= 'started' ) ) | ( (lv_Finished2Finish_1_0= 'finished' ) ) )
            int alt8=2;
            int LA8_0 = input.LA(1);

            if ( (LA8_0==18) ) {
                alt8=1;
            }
            else if ( (LA8_0==19) ) {
                alt8=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 8, 0, input);

                throw nvae;
            }
            switch (alt8) {
                case 1 :
                    // InternalPDL2.g:440:3: ( (lv_Finished2Start_0_0= 'started' ) )
                    {
                    // InternalPDL2.g:440:3: ( (lv_Finished2Start_0_0= 'started' ) )
                    // InternalPDL2.g:441:4: (lv_Finished2Start_0_0= 'started' )
                    {
                    // InternalPDL2.g:441:4: (lv_Finished2Start_0_0= 'started' )
                    // InternalPDL2.g:442:5: lv_Finished2Start_0_0= 'started'
                    {
                    lv_Finished2Start_0_0=(Token)match(input,18,FOLLOW_2); 

                    					newLeafNode(lv_Finished2Start_0_0, grammarAccess.getWorkSequenceKindFinishAccess().getFinished2StartStartedKeyword_0_0());
                    				

                    					if (current==null) {
                    						current = createModelElement(grammarAccess.getWorkSequenceKindFinishRule());
                    					}
                    					setWithLastConsumed(current, "Finished2Start", lv_Finished2Start_0_0, "started");
                    				

                    }


                    }


                    }
                    break;
                case 2 :
                    // InternalPDL2.g:455:3: ( (lv_Finished2Finish_1_0= 'finished' ) )
                    {
                    // InternalPDL2.g:455:3: ( (lv_Finished2Finish_1_0= 'finished' ) )
                    // InternalPDL2.g:456:4: (lv_Finished2Finish_1_0= 'finished' )
                    {
                    // InternalPDL2.g:456:4: (lv_Finished2Finish_1_0= 'finished' )
                    // InternalPDL2.g:457:5: lv_Finished2Finish_1_0= 'finished'
                    {
                    lv_Finished2Finish_1_0=(Token)match(input,19,FOLLOW_2); 

                    					newLeafNode(lv_Finished2Finish_1_0, grammarAccess.getWorkSequenceKindFinishAccess().getFinished2FinishFinishedKeyword_1_0());
                    				

                    					if (current==null) {
                    						current = createModelElement(grammarAccess.getWorkSequenceKindFinishRule());
                    					}
                    					setWithLastConsumed(current, "Finished2Finish", lv_Finished2Finish_1_0, "finished");
                    				

                    }


                    }


                    }
                    break;

            }


            }


            	leaveRule();

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleWorkSequenceKindFinish"


    // $ANTLR start "entryRuleGuidance"
    // InternalPDL2.g:473:1: entryRuleGuidance returns [EObject current=null] : iv_ruleGuidance= ruleGuidance EOF ;
    public final EObject entryRuleGuidance() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleGuidance = null;


        try {
            // InternalPDL2.g:473:49: (iv_ruleGuidance= ruleGuidance EOF )
            // InternalPDL2.g:474:2: iv_ruleGuidance= ruleGuidance EOF
            {
             newCompositeNode(grammarAccess.getGuidanceRule()); 
            pushFollow(FOLLOW_1);
            iv_ruleGuidance=ruleGuidance();

            state._fsp--;

             current =iv_ruleGuidance; 
            match(input,EOF,FOLLOW_2); 

            }

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "entryRuleGuidance"


    // $ANTLR start "ruleGuidance"
    // InternalPDL2.g:480:1: ruleGuidance returns [EObject current=null] : (otherlv_0= 'note' ( (lv_texte_1_0= RULE_STRING ) ) ) ;
    public final EObject ruleGuidance() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        Token lv_texte_1_0=null;


        	enterRule();

        try {
            // InternalPDL2.g:486:2: ( (otherlv_0= 'note' ( (lv_texte_1_0= RULE_STRING ) ) ) )
            // InternalPDL2.g:487:2: (otherlv_0= 'note' ( (lv_texte_1_0= RULE_STRING ) ) )
            {
            // InternalPDL2.g:487:2: (otherlv_0= 'note' ( (lv_texte_1_0= RULE_STRING ) ) )
            // InternalPDL2.g:488:3: otherlv_0= 'note' ( (lv_texte_1_0= RULE_STRING ) )
            {
            otherlv_0=(Token)match(input,20,FOLLOW_11); 

            			newLeafNode(otherlv_0, grammarAccess.getGuidanceAccess().getNoteKeyword_0());
            		
            // InternalPDL2.g:492:3: ( (lv_texte_1_0= RULE_STRING ) )
            // InternalPDL2.g:493:4: (lv_texte_1_0= RULE_STRING )
            {
            // InternalPDL2.g:493:4: (lv_texte_1_0= RULE_STRING )
            // InternalPDL2.g:494:5: lv_texte_1_0= RULE_STRING
            {
            lv_texte_1_0=(Token)match(input,RULE_STRING,FOLLOW_2); 

            					newLeafNode(lv_texte_1_0, grammarAccess.getGuidanceAccess().getTexteSTRINGTerminalRuleCall_1_0());
            				

            					if (current==null) {
            						current = createModelElement(grammarAccess.getGuidanceRule());
            					}
            					setWithLastConsumed(
            						current,
            						"texte",
            						lv_texte_1_0,
            						"org.eclipse.xtext.common.Terminals.STRING");
            				

            }


            }


            }


            }


            	leaveRule();

        }

            catch (RecognitionException re) {
                recover(input,re);
                appendSkippedTokens();
            }
        finally {
        }
        return current;
    }
    // $ANTLR end "ruleGuidance"

    // Delegated rules


 

    public static final BitSet FOLLOW_1 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_2 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_3 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_4 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_5 = new BitSet(new long[]{0x0000000000106000L});
    public static final BitSet FOLLOW_6 = new BitSet(new long[]{0x000000000002A000L});
    public static final BitSet FOLLOW_7 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_8 = new BitSet(new long[]{0x0000000000022010L});
    public static final BitSet FOLLOW_9 = new BitSet(new long[]{0x0000000000002010L});
    public static final BitSet FOLLOW_10 = new BitSet(new long[]{0x00000000000C0000L});
    public static final BitSet FOLLOW_11 = new BitSet(new long[]{0x0000000000000020L});

}