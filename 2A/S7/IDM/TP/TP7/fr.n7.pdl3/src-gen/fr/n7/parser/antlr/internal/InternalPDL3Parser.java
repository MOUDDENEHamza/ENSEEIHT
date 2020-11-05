package fr.n7.parser.antlr.internal;

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.common.util.Enumerator;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import fr.n7.services.PDL3GrammarAccess;



import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class InternalPDL3Parser extends AbstractInternalAntlrParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "RULE_ID", "RULE_INT", "RULE_STRING", "RULE_ML_COMMENT", "RULE_SL_COMMENT", "RULE_WS", "RULE_ANY_OTHER", "'process : '", "'workdefinitions : '", "'worksequences : '", "'; '", "' s2s '", "' f2s '", "' s2f '", "' f2f '"
    };
    public static final int RULE_ID=4;
    public static final int RULE_WS=9;
    public static final int RULE_STRING=6;
    public static final int RULE_ANY_OTHER=10;
    public static final int RULE_SL_COMMENT=8;
    public static final int T__15=15;
    public static final int T__16=16;
    public static final int T__17=17;
    public static final int RULE_INT=5;
    public static final int T__18=18;
    public static final int T__11=11;
    public static final int RULE_ML_COMMENT=7;
    public static final int T__12=12;
    public static final int T__13=13;
    public static final int T__14=14;
    public static final int EOF=-1;

    // delegates
    // delegators


        public InternalPDL3Parser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public InternalPDL3Parser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        

    public String[] getTokenNames() { return InternalPDL3Parser.tokenNames; }
    public String getGrammarFileName() { return "InternalPDL3.g"; }



     	private PDL3GrammarAccess grammarAccess;

        public InternalPDL3Parser(TokenStream input, PDL3GrammarAccess grammarAccess) {
            this(input);
            this.grammarAccess = grammarAccess;
            registerRules(grammarAccess.getGrammar());
        }

        @Override
        protected String getFirstRuleName() {
        	return "Process";
       	}

       	@Override
       	protected PDL3GrammarAccess getGrammarAccess() {
       		return grammarAccess;
       	}




    // $ANTLR start "entryRuleProcess"
    // InternalPDL3.g:65:1: entryRuleProcess returns [EObject current=null] : iv_ruleProcess= ruleProcess EOF ;
    public final EObject entryRuleProcess() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleProcess = null;


        try {
            // InternalPDL3.g:65:48: (iv_ruleProcess= ruleProcess EOF )
            // InternalPDL3.g:66:2: iv_ruleProcess= ruleProcess EOF
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
    // InternalPDL3.g:72:1: ruleProcess returns [EObject current=null] : (otherlv_0= 'process : ' ( (lv_name_1_0= RULE_ID ) ) ( (lv_processElements_2_0= ruleProcessElement ) )* ) ;
    public final EObject ruleProcess() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        Token lv_name_1_0=null;
        EObject lv_processElements_2_0 = null;



        	enterRule();

        try {
            // InternalPDL3.g:78:2: ( (otherlv_0= 'process : ' ( (lv_name_1_0= RULE_ID ) ) ( (lv_processElements_2_0= ruleProcessElement ) )* ) )
            // InternalPDL3.g:79:2: (otherlv_0= 'process : ' ( (lv_name_1_0= RULE_ID ) ) ( (lv_processElements_2_0= ruleProcessElement ) )* )
            {
            // InternalPDL3.g:79:2: (otherlv_0= 'process : ' ( (lv_name_1_0= RULE_ID ) ) ( (lv_processElements_2_0= ruleProcessElement ) )* )
            // InternalPDL3.g:80:3: otherlv_0= 'process : ' ( (lv_name_1_0= RULE_ID ) ) ( (lv_processElements_2_0= ruleProcessElement ) )*
            {
            otherlv_0=(Token)match(input,11,FOLLOW_3); 

            			newLeafNode(otherlv_0, grammarAccess.getProcessAccess().getProcessKeyword_0());
            		
            // InternalPDL3.g:84:3: ( (lv_name_1_0= RULE_ID ) )
            // InternalPDL3.g:85:4: (lv_name_1_0= RULE_ID )
            {
            // InternalPDL3.g:85:4: (lv_name_1_0= RULE_ID )
            // InternalPDL3.g:86:5: lv_name_1_0= RULE_ID
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

            // InternalPDL3.g:102:3: ( (lv_processElements_2_0= ruleProcessElement ) )*
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( ((LA1_0>=12 && LA1_0<=13)) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // InternalPDL3.g:103:4: (lv_processElements_2_0= ruleProcessElement )
            	    {
            	    // InternalPDL3.g:103:4: (lv_processElements_2_0= ruleProcessElement )
            	    // InternalPDL3.g:104:5: lv_processElements_2_0= ruleProcessElement
            	    {

            	    					newCompositeNode(grammarAccess.getProcessAccess().getProcessElementsProcessElementParserRuleCall_2_0());
            	    				
            	    pushFollow(FOLLOW_4);
            	    lv_processElements_2_0=ruleProcessElement();

            	    state._fsp--;


            	    					if (current==null) {
            	    						current = createModelElementForParent(grammarAccess.getProcessRule());
            	    					}
            	    					add(
            	    						current,
            	    						"processElements",
            	    						lv_processElements_2_0,
            	    						"fr.n7.PDL3.ProcessElement");
            	    					afterParserOrEnumRuleCall();
            	    				

            	    }


            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);


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
    // InternalPDL3.g:125:1: entryRuleProcessElement returns [EObject current=null] : iv_ruleProcessElement= ruleProcessElement EOF ;
    public final EObject entryRuleProcessElement() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleProcessElement = null;


        try {
            // InternalPDL3.g:125:55: (iv_ruleProcessElement= ruleProcessElement EOF )
            // InternalPDL3.g:126:2: iv_ruleProcessElement= ruleProcessElement EOF
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
    // InternalPDL3.g:132:1: ruleProcessElement returns [EObject current=null] : ( (otherlv_0= 'workdefinitions : ' ( (lv_workDefinition_1_0= ruleWorkDefinition ) )+ ) | (otherlv_2= 'worksequences : ' ( (lv_workSequence_3_0= ruleWorkSequence ) )+ ) ) ;
    public final EObject ruleProcessElement() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        Token otherlv_2=null;
        EObject lv_workDefinition_1_0 = null;

        EObject lv_workSequence_3_0 = null;



        	enterRule();

        try {
            // InternalPDL3.g:138:2: ( ( (otherlv_0= 'workdefinitions : ' ( (lv_workDefinition_1_0= ruleWorkDefinition ) )+ ) | (otherlv_2= 'worksequences : ' ( (lv_workSequence_3_0= ruleWorkSequence ) )+ ) ) )
            // InternalPDL3.g:139:2: ( (otherlv_0= 'workdefinitions : ' ( (lv_workDefinition_1_0= ruleWorkDefinition ) )+ ) | (otherlv_2= 'worksequences : ' ( (lv_workSequence_3_0= ruleWorkSequence ) )+ ) )
            {
            // InternalPDL3.g:139:2: ( (otherlv_0= 'workdefinitions : ' ( (lv_workDefinition_1_0= ruleWorkDefinition ) )+ ) | (otherlv_2= 'worksequences : ' ( (lv_workSequence_3_0= ruleWorkSequence ) )+ ) )
            int alt4=2;
            int LA4_0 = input.LA(1);

            if ( (LA4_0==12) ) {
                alt4=1;
            }
            else if ( (LA4_0==13) ) {
                alt4=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 4, 0, input);

                throw nvae;
            }
            switch (alt4) {
                case 1 :
                    // InternalPDL3.g:140:3: (otherlv_0= 'workdefinitions : ' ( (lv_workDefinition_1_0= ruleWorkDefinition ) )+ )
                    {
                    // InternalPDL3.g:140:3: (otherlv_0= 'workdefinitions : ' ( (lv_workDefinition_1_0= ruleWorkDefinition ) )+ )
                    // InternalPDL3.g:141:4: otherlv_0= 'workdefinitions : ' ( (lv_workDefinition_1_0= ruleWorkDefinition ) )+
                    {
                    otherlv_0=(Token)match(input,12,FOLLOW_3); 

                    				newLeafNode(otherlv_0, grammarAccess.getProcessElementAccess().getWorkdefinitionsKeyword_0_0());
                    			
                    // InternalPDL3.g:145:4: ( (lv_workDefinition_1_0= ruleWorkDefinition ) )+
                    int cnt2=0;
                    loop2:
                    do {
                        int alt2=2;
                        int LA2_0 = input.LA(1);

                        if ( (LA2_0==RULE_ID) ) {
                            alt2=1;
                        }


                        switch (alt2) {
                    	case 1 :
                    	    // InternalPDL3.g:146:5: (lv_workDefinition_1_0= ruleWorkDefinition )
                    	    {
                    	    // InternalPDL3.g:146:5: (lv_workDefinition_1_0= ruleWorkDefinition )
                    	    // InternalPDL3.g:147:6: lv_workDefinition_1_0= ruleWorkDefinition
                    	    {

                    	    						newCompositeNode(grammarAccess.getProcessElementAccess().getWorkDefinitionWorkDefinitionParserRuleCall_0_1_0());
                    	    					
                    	    pushFollow(FOLLOW_5);
                    	    lv_workDefinition_1_0=ruleWorkDefinition();

                    	    state._fsp--;


                    	    						if (current==null) {
                    	    							current = createModelElementForParent(grammarAccess.getProcessElementRule());
                    	    						}
                    	    						add(
                    	    							current,
                    	    							"workDefinition",
                    	    							lv_workDefinition_1_0,
                    	    							"fr.n7.PDL3.WorkDefinition");
                    	    						afterParserOrEnumRuleCall();
                    	    					

                    	    }


                    	    }
                    	    break;

                    	default :
                    	    if ( cnt2 >= 1 ) break loop2;
                                EarlyExitException eee =
                                    new EarlyExitException(2, input);
                                throw eee;
                        }
                        cnt2++;
                    } while (true);


                    }


                    }
                    break;
                case 2 :
                    // InternalPDL3.g:166:3: (otherlv_2= 'worksequences : ' ( (lv_workSequence_3_0= ruleWorkSequence ) )+ )
                    {
                    // InternalPDL3.g:166:3: (otherlv_2= 'worksequences : ' ( (lv_workSequence_3_0= ruleWorkSequence ) )+ )
                    // InternalPDL3.g:167:4: otherlv_2= 'worksequences : ' ( (lv_workSequence_3_0= ruleWorkSequence ) )+
                    {
                    otherlv_2=(Token)match(input,13,FOLLOW_3); 

                    				newLeafNode(otherlv_2, grammarAccess.getProcessElementAccess().getWorksequencesKeyword_1_0());
                    			
                    // InternalPDL3.g:171:4: ( (lv_workSequence_3_0= ruleWorkSequence ) )+
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
                    	    // InternalPDL3.g:172:5: (lv_workSequence_3_0= ruleWorkSequence )
                    	    {
                    	    // InternalPDL3.g:172:5: (lv_workSequence_3_0= ruleWorkSequence )
                    	    // InternalPDL3.g:173:6: lv_workSequence_3_0= ruleWorkSequence
                    	    {

                    	    						newCompositeNode(grammarAccess.getProcessElementAccess().getWorkSequenceWorkSequenceParserRuleCall_1_1_0());
                    	    					
                    	    pushFollow(FOLLOW_5);
                    	    lv_workSequence_3_0=ruleWorkSequence();

                    	    state._fsp--;


                    	    						if (current==null) {
                    	    							current = createModelElementForParent(grammarAccess.getProcessElementRule());
                    	    						}
                    	    						add(
                    	    							current,
                    	    							"workSequence",
                    	    							lv_workSequence_3_0,
                    	    							"fr.n7.PDL3.WorkSequence");
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
    // InternalPDL3.g:195:1: entryRuleWorkDefinition returns [EObject current=null] : iv_ruleWorkDefinition= ruleWorkDefinition EOF ;
    public final EObject entryRuleWorkDefinition() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleWorkDefinition = null;


        try {
            // InternalPDL3.g:195:55: (iv_ruleWorkDefinition= ruleWorkDefinition EOF )
            // InternalPDL3.g:196:2: iv_ruleWorkDefinition= ruleWorkDefinition EOF
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
    // InternalPDL3.g:202:1: ruleWorkDefinition returns [EObject current=null] : ( ( (lv_name_0_0= RULE_ID ) ) otherlv_1= '; ' ) ;
    public final EObject ruleWorkDefinition() throws RecognitionException {
        EObject current = null;

        Token lv_name_0_0=null;
        Token otherlv_1=null;


        	enterRule();

        try {
            // InternalPDL3.g:208:2: ( ( ( (lv_name_0_0= RULE_ID ) ) otherlv_1= '; ' ) )
            // InternalPDL3.g:209:2: ( ( (lv_name_0_0= RULE_ID ) ) otherlv_1= '; ' )
            {
            // InternalPDL3.g:209:2: ( ( (lv_name_0_0= RULE_ID ) ) otherlv_1= '; ' )
            // InternalPDL3.g:210:3: ( (lv_name_0_0= RULE_ID ) ) otherlv_1= '; '
            {
            // InternalPDL3.g:210:3: ( (lv_name_0_0= RULE_ID ) )
            // InternalPDL3.g:211:4: (lv_name_0_0= RULE_ID )
            {
            // InternalPDL3.g:211:4: (lv_name_0_0= RULE_ID )
            // InternalPDL3.g:212:5: lv_name_0_0= RULE_ID
            {
            lv_name_0_0=(Token)match(input,RULE_ID,FOLLOW_6); 

            					newLeafNode(lv_name_0_0, grammarAccess.getWorkDefinitionAccess().getNameIDTerminalRuleCall_0_0());
            				

            					if (current==null) {
            						current = createModelElement(grammarAccess.getWorkDefinitionRule());
            					}
            					setWithLastConsumed(
            						current,
            						"name",
            						lv_name_0_0,
            						"org.eclipse.xtext.common.Terminals.ID");
            				

            }


            }

            otherlv_1=(Token)match(input,14,FOLLOW_2); 

            			newLeafNode(otherlv_1, grammarAccess.getWorkDefinitionAccess().getSemicolonSpaceKeyword_1());
            		

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


    // $ANTLR start "entryRuleWorkSequence"
    // InternalPDL3.g:236:1: entryRuleWorkSequence returns [EObject current=null] : iv_ruleWorkSequence= ruleWorkSequence EOF ;
    public final EObject entryRuleWorkSequence() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleWorkSequence = null;


        try {
            // InternalPDL3.g:236:53: (iv_ruleWorkSequence= ruleWorkSequence EOF )
            // InternalPDL3.g:237:2: iv_ruleWorkSequence= ruleWorkSequence EOF
            {
             newCompositeNode(grammarAccess.getWorkSequenceRule()); 
            pushFollow(FOLLOW_1);
            iv_ruleWorkSequence=ruleWorkSequence();

            state._fsp--;

             current =iv_ruleWorkSequence; 
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
    // $ANTLR end "entryRuleWorkSequence"


    // $ANTLR start "ruleWorkSequence"
    // InternalPDL3.g:243:1: ruleWorkSequence returns [EObject current=null] : ( ( (otherlv_0= RULE_ID ) ) ( (lv_linkType_1_0= ruleWorkSequenceType ) ) ( (otherlv_2= RULE_ID ) ) otherlv_3= '; ' ) ;
    public final EObject ruleWorkSequence() throws RecognitionException {
        EObject current = null;

        Token otherlv_0=null;
        Token otherlv_2=null;
        Token otherlv_3=null;
        Enumerator lv_linkType_1_0 = null;



        	enterRule();

        try {
            // InternalPDL3.g:249:2: ( ( ( (otherlv_0= RULE_ID ) ) ( (lv_linkType_1_0= ruleWorkSequenceType ) ) ( (otherlv_2= RULE_ID ) ) otherlv_3= '; ' ) )
            // InternalPDL3.g:250:2: ( ( (otherlv_0= RULE_ID ) ) ( (lv_linkType_1_0= ruleWorkSequenceType ) ) ( (otherlv_2= RULE_ID ) ) otherlv_3= '; ' )
            {
            // InternalPDL3.g:250:2: ( ( (otherlv_0= RULE_ID ) ) ( (lv_linkType_1_0= ruleWorkSequenceType ) ) ( (otherlv_2= RULE_ID ) ) otherlv_3= '; ' )
            // InternalPDL3.g:251:3: ( (otherlv_0= RULE_ID ) ) ( (lv_linkType_1_0= ruleWorkSequenceType ) ) ( (otherlv_2= RULE_ID ) ) otherlv_3= '; '
            {
            // InternalPDL3.g:251:3: ( (otherlv_0= RULE_ID ) )
            // InternalPDL3.g:252:4: (otherlv_0= RULE_ID )
            {
            // InternalPDL3.g:252:4: (otherlv_0= RULE_ID )
            // InternalPDL3.g:253:5: otherlv_0= RULE_ID
            {

            					if (current==null) {
            						current = createModelElement(grammarAccess.getWorkSequenceRule());
            					}
            				
            otherlv_0=(Token)match(input,RULE_ID,FOLLOW_7); 

            					newLeafNode(otherlv_0, grammarAccess.getWorkSequenceAccess().getPredecessorWorkDefinitionCrossReference_0_0());
            				

            }


            }

            // InternalPDL3.g:264:3: ( (lv_linkType_1_0= ruleWorkSequenceType ) )
            // InternalPDL3.g:265:4: (lv_linkType_1_0= ruleWorkSequenceType )
            {
            // InternalPDL3.g:265:4: (lv_linkType_1_0= ruleWorkSequenceType )
            // InternalPDL3.g:266:5: lv_linkType_1_0= ruleWorkSequenceType
            {

            					newCompositeNode(grammarAccess.getWorkSequenceAccess().getLinkTypeWorkSequenceTypeEnumRuleCall_1_0());
            				
            pushFollow(FOLLOW_3);
            lv_linkType_1_0=ruleWorkSequenceType();

            state._fsp--;


            					if (current==null) {
            						current = createModelElementForParent(grammarAccess.getWorkSequenceRule());
            					}
            					set(
            						current,
            						"linkType",
            						lv_linkType_1_0,
            						"fr.n7.PDL3.WorkSequenceType");
            					afterParserOrEnumRuleCall();
            				

            }


            }

            // InternalPDL3.g:283:3: ( (otherlv_2= RULE_ID ) )
            // InternalPDL3.g:284:4: (otherlv_2= RULE_ID )
            {
            // InternalPDL3.g:284:4: (otherlv_2= RULE_ID )
            // InternalPDL3.g:285:5: otherlv_2= RULE_ID
            {

            					if (current==null) {
            						current = createModelElement(grammarAccess.getWorkSequenceRule());
            					}
            				
            otherlv_2=(Token)match(input,RULE_ID,FOLLOW_6); 

            					newLeafNode(otherlv_2, grammarAccess.getWorkSequenceAccess().getSuccessorWorkDefinitionCrossReference_2_0());
            				

            }


            }

            otherlv_3=(Token)match(input,14,FOLLOW_2); 

            			newLeafNode(otherlv_3, grammarAccess.getWorkSequenceAccess().getSemicolonSpaceKeyword_3());
            		

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
    // $ANTLR end "ruleWorkSequence"


    // $ANTLR start "ruleWorkSequenceType"
    // InternalPDL3.g:304:1: ruleWorkSequenceType returns [Enumerator current=null] : ( (enumLiteral_0= ' s2s ' ) | (enumLiteral_1= ' f2s ' ) | (enumLiteral_2= ' s2f ' ) | (enumLiteral_3= ' f2f ' ) ) ;
    public final Enumerator ruleWorkSequenceType() throws RecognitionException {
        Enumerator current = null;

        Token enumLiteral_0=null;
        Token enumLiteral_1=null;
        Token enumLiteral_2=null;
        Token enumLiteral_3=null;


        	enterRule();

        try {
            // InternalPDL3.g:310:2: ( ( (enumLiteral_0= ' s2s ' ) | (enumLiteral_1= ' f2s ' ) | (enumLiteral_2= ' s2f ' ) | (enumLiteral_3= ' f2f ' ) ) )
            // InternalPDL3.g:311:2: ( (enumLiteral_0= ' s2s ' ) | (enumLiteral_1= ' f2s ' ) | (enumLiteral_2= ' s2f ' ) | (enumLiteral_3= ' f2f ' ) )
            {
            // InternalPDL3.g:311:2: ( (enumLiteral_0= ' s2s ' ) | (enumLiteral_1= ' f2s ' ) | (enumLiteral_2= ' s2f ' ) | (enumLiteral_3= ' f2f ' ) )
            int alt5=4;
            switch ( input.LA(1) ) {
            case 15:
                {
                alt5=1;
                }
                break;
            case 16:
                {
                alt5=2;
                }
                break;
            case 17:
                {
                alt5=3;
                }
                break;
            case 18:
                {
                alt5=4;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 5, 0, input);

                throw nvae;
            }

            switch (alt5) {
                case 1 :
                    // InternalPDL3.g:312:3: (enumLiteral_0= ' s2s ' )
                    {
                    // InternalPDL3.g:312:3: (enumLiteral_0= ' s2s ' )
                    // InternalPDL3.g:313:4: enumLiteral_0= ' s2s '
                    {
                    enumLiteral_0=(Token)match(input,15,FOLLOW_2); 

                    				current = grammarAccess.getWorkSequenceTypeAccess().getStart2startEnumLiteralDeclaration_0().getEnumLiteral().getInstance();
                    				newLeafNode(enumLiteral_0, grammarAccess.getWorkSequenceTypeAccess().getStart2startEnumLiteralDeclaration_0());
                    			

                    }


                    }
                    break;
                case 2 :
                    // InternalPDL3.g:320:3: (enumLiteral_1= ' f2s ' )
                    {
                    // InternalPDL3.g:320:3: (enumLiteral_1= ' f2s ' )
                    // InternalPDL3.g:321:4: enumLiteral_1= ' f2s '
                    {
                    enumLiteral_1=(Token)match(input,16,FOLLOW_2); 

                    				current = grammarAccess.getWorkSequenceTypeAccess().getFinish2startEnumLiteralDeclaration_1().getEnumLiteral().getInstance();
                    				newLeafNode(enumLiteral_1, grammarAccess.getWorkSequenceTypeAccess().getFinish2startEnumLiteralDeclaration_1());
                    			

                    }


                    }
                    break;
                case 3 :
                    // InternalPDL3.g:328:3: (enumLiteral_2= ' s2f ' )
                    {
                    // InternalPDL3.g:328:3: (enumLiteral_2= ' s2f ' )
                    // InternalPDL3.g:329:4: enumLiteral_2= ' s2f '
                    {
                    enumLiteral_2=(Token)match(input,17,FOLLOW_2); 

                    				current = grammarAccess.getWorkSequenceTypeAccess().getStart2finishEnumLiteralDeclaration_2().getEnumLiteral().getInstance();
                    				newLeafNode(enumLiteral_2, grammarAccess.getWorkSequenceTypeAccess().getStart2finishEnumLiteralDeclaration_2());
                    			

                    }


                    }
                    break;
                case 4 :
                    // InternalPDL3.g:336:3: (enumLiteral_3= ' f2f ' )
                    {
                    // InternalPDL3.g:336:3: (enumLiteral_3= ' f2f ' )
                    // InternalPDL3.g:337:4: enumLiteral_3= ' f2f '
                    {
                    enumLiteral_3=(Token)match(input,18,FOLLOW_2); 

                    				current = grammarAccess.getWorkSequenceTypeAccess().getFinish2finishEnumLiteralDeclaration_3().getEnumLiteral().getInstance();
                    				newLeafNode(enumLiteral_3, grammarAccess.getWorkSequenceTypeAccess().getFinish2finishEnumLiteralDeclaration_3());
                    			

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
    // $ANTLR end "ruleWorkSequenceType"

    // Delegated rules


 

    public static final BitSet FOLLOW_1 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_2 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_3 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_4 = new BitSet(new long[]{0x0000000000003002L});
    public static final BitSet FOLLOW_5 = new BitSet(new long[]{0x0000000000000012L});
    public static final BitSet FOLLOW_6 = new BitSet(new long[]{0x0000000000004000L});
    public static final BitSet FOLLOW_7 = new BitSet(new long[]{0x0000000000078000L});

}