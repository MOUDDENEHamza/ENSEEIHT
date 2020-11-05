package fr.n7.ide.contentassist.antlr.internal;

import java.io.InputStream;
import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.ide.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;
import org.eclipse.xtext.ide.editor.contentassist.antlr.internal.DFA;
import fr.n7.services.PDL2GrammarAccess;



import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class InternalPDL2Parser extends AbstractInternalContentAssistParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "RULE_ID", "RULE_STRING", "RULE_INT", "RULE_ML_COMMENT", "RULE_SL_COMMENT", "RULE_WS", "RULE_ANY_OTHER", "'process'", "'{'", "'}'", "'wd'", "'starts'", "'if'", "'finishes'", "'note'", "'started'", "'finished'"
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

    	public void setGrammarAccess(PDL2GrammarAccess grammarAccess) {
    		this.grammarAccess = grammarAccess;
    	}

    	@Override
    	protected Grammar getGrammar() {
    		return grammarAccess.getGrammar();
    	}

    	@Override
    	protected String getValueForTokenName(String tokenName) {
    		return tokenName;
    	}



    // $ANTLR start "entryRuleProcess"
    // InternalPDL2.g:53:1: entryRuleProcess : ruleProcess EOF ;
    public final void entryRuleProcess() throws RecognitionException {
        try {
            // InternalPDL2.g:54:1: ( ruleProcess EOF )
            // InternalPDL2.g:55:1: ruleProcess EOF
            {
             before(grammarAccess.getProcessRule()); 
            pushFollow(FOLLOW_1);
            ruleProcess();

            state._fsp--;

             after(grammarAccess.getProcessRule()); 
            match(input,EOF,FOLLOW_2); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleProcess"


    // $ANTLR start "ruleProcess"
    // InternalPDL2.g:62:1: ruleProcess : ( ( rule__Process__Group__0 ) ) ;
    public final void ruleProcess() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:66:2: ( ( ( rule__Process__Group__0 ) ) )
            // InternalPDL2.g:67:2: ( ( rule__Process__Group__0 ) )
            {
            // InternalPDL2.g:67:2: ( ( rule__Process__Group__0 ) )
            // InternalPDL2.g:68:3: ( rule__Process__Group__0 )
            {
             before(grammarAccess.getProcessAccess().getGroup()); 
            // InternalPDL2.g:69:3: ( rule__Process__Group__0 )
            // InternalPDL2.g:69:4: rule__Process__Group__0
            {
            pushFollow(FOLLOW_2);
            rule__Process__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getProcessAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleProcess"


    // $ANTLR start "entryRuleProcessElement"
    // InternalPDL2.g:78:1: entryRuleProcessElement : ruleProcessElement EOF ;
    public final void entryRuleProcessElement() throws RecognitionException {
        try {
            // InternalPDL2.g:79:1: ( ruleProcessElement EOF )
            // InternalPDL2.g:80:1: ruleProcessElement EOF
            {
             before(grammarAccess.getProcessElementRule()); 
            pushFollow(FOLLOW_1);
            ruleProcessElement();

            state._fsp--;

             after(grammarAccess.getProcessElementRule()); 
            match(input,EOF,FOLLOW_2); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleProcessElement"


    // $ANTLR start "ruleProcessElement"
    // InternalPDL2.g:87:1: ruleProcessElement : ( ( rule__ProcessElement__Alternatives ) ) ;
    public final void ruleProcessElement() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:91:2: ( ( ( rule__ProcessElement__Alternatives ) ) )
            // InternalPDL2.g:92:2: ( ( rule__ProcessElement__Alternatives ) )
            {
            // InternalPDL2.g:92:2: ( ( rule__ProcessElement__Alternatives ) )
            // InternalPDL2.g:93:3: ( rule__ProcessElement__Alternatives )
            {
             before(grammarAccess.getProcessElementAccess().getAlternatives()); 
            // InternalPDL2.g:94:3: ( rule__ProcessElement__Alternatives )
            // InternalPDL2.g:94:4: rule__ProcessElement__Alternatives
            {
            pushFollow(FOLLOW_2);
            rule__ProcessElement__Alternatives();

            state._fsp--;


            }

             after(grammarAccess.getProcessElementAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleProcessElement"


    // $ANTLR start "entryRuleWorkDefinition"
    // InternalPDL2.g:103:1: entryRuleWorkDefinition : ruleWorkDefinition EOF ;
    public final void entryRuleWorkDefinition() throws RecognitionException {
        try {
            // InternalPDL2.g:104:1: ( ruleWorkDefinition EOF )
            // InternalPDL2.g:105:1: ruleWorkDefinition EOF
            {
             before(grammarAccess.getWorkDefinitionRule()); 
            pushFollow(FOLLOW_1);
            ruleWorkDefinition();

            state._fsp--;

             after(grammarAccess.getWorkDefinitionRule()); 
            match(input,EOF,FOLLOW_2); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleWorkDefinition"


    // $ANTLR start "ruleWorkDefinition"
    // InternalPDL2.g:112:1: ruleWorkDefinition : ( ( rule__WorkDefinition__Group__0 ) ) ;
    public final void ruleWorkDefinition() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:116:2: ( ( ( rule__WorkDefinition__Group__0 ) ) )
            // InternalPDL2.g:117:2: ( ( rule__WorkDefinition__Group__0 ) )
            {
            // InternalPDL2.g:117:2: ( ( rule__WorkDefinition__Group__0 ) )
            // InternalPDL2.g:118:3: ( rule__WorkDefinition__Group__0 )
            {
             before(grammarAccess.getWorkDefinitionAccess().getGroup()); 
            // InternalPDL2.g:119:3: ( rule__WorkDefinition__Group__0 )
            // InternalPDL2.g:119:4: rule__WorkDefinition__Group__0
            {
            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getWorkDefinitionAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleWorkDefinition"


    // $ANTLR start "entryRuleDependanceStart"
    // InternalPDL2.g:128:1: entryRuleDependanceStart : ruleDependanceStart EOF ;
    public final void entryRuleDependanceStart() throws RecognitionException {
        try {
            // InternalPDL2.g:129:1: ( ruleDependanceStart EOF )
            // InternalPDL2.g:130:1: ruleDependanceStart EOF
            {
             before(grammarAccess.getDependanceStartRule()); 
            pushFollow(FOLLOW_1);
            ruleDependanceStart();

            state._fsp--;

             after(grammarAccess.getDependanceStartRule()); 
            match(input,EOF,FOLLOW_2); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleDependanceStart"


    // $ANTLR start "ruleDependanceStart"
    // InternalPDL2.g:137:1: ruleDependanceStart : ( ( rule__DependanceStart__Group__0 ) ) ;
    public final void ruleDependanceStart() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:141:2: ( ( ( rule__DependanceStart__Group__0 ) ) )
            // InternalPDL2.g:142:2: ( ( rule__DependanceStart__Group__0 ) )
            {
            // InternalPDL2.g:142:2: ( ( rule__DependanceStart__Group__0 ) )
            // InternalPDL2.g:143:3: ( rule__DependanceStart__Group__0 )
            {
             before(grammarAccess.getDependanceStartAccess().getGroup()); 
            // InternalPDL2.g:144:3: ( rule__DependanceStart__Group__0 )
            // InternalPDL2.g:144:4: rule__DependanceStart__Group__0
            {
            pushFollow(FOLLOW_2);
            rule__DependanceStart__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getDependanceStartAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleDependanceStart"


    // $ANTLR start "entryRuleWorkSequenceKindStart"
    // InternalPDL2.g:153:1: entryRuleWorkSequenceKindStart : ruleWorkSequenceKindStart EOF ;
    public final void entryRuleWorkSequenceKindStart() throws RecognitionException {
        try {
            // InternalPDL2.g:154:1: ( ruleWorkSequenceKindStart EOF )
            // InternalPDL2.g:155:1: ruleWorkSequenceKindStart EOF
            {
             before(grammarAccess.getWorkSequenceKindStartRule()); 
            pushFollow(FOLLOW_1);
            ruleWorkSequenceKindStart();

            state._fsp--;

             after(grammarAccess.getWorkSequenceKindStartRule()); 
            match(input,EOF,FOLLOW_2); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleWorkSequenceKindStart"


    // $ANTLR start "ruleWorkSequenceKindStart"
    // InternalPDL2.g:162:1: ruleWorkSequenceKindStart : ( ( rule__WorkSequenceKindStart__Alternatives ) ) ;
    public final void ruleWorkSequenceKindStart() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:166:2: ( ( ( rule__WorkSequenceKindStart__Alternatives ) ) )
            // InternalPDL2.g:167:2: ( ( rule__WorkSequenceKindStart__Alternatives ) )
            {
            // InternalPDL2.g:167:2: ( ( rule__WorkSequenceKindStart__Alternatives ) )
            // InternalPDL2.g:168:3: ( rule__WorkSequenceKindStart__Alternatives )
            {
             before(grammarAccess.getWorkSequenceKindStartAccess().getAlternatives()); 
            // InternalPDL2.g:169:3: ( rule__WorkSequenceKindStart__Alternatives )
            // InternalPDL2.g:169:4: rule__WorkSequenceKindStart__Alternatives
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequenceKindStart__Alternatives();

            state._fsp--;


            }

             after(grammarAccess.getWorkSequenceKindStartAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleWorkSequenceKindStart"


    // $ANTLR start "entryRuleDependanceFinish"
    // InternalPDL2.g:178:1: entryRuleDependanceFinish : ruleDependanceFinish EOF ;
    public final void entryRuleDependanceFinish() throws RecognitionException {
        try {
            // InternalPDL2.g:179:1: ( ruleDependanceFinish EOF )
            // InternalPDL2.g:180:1: ruleDependanceFinish EOF
            {
             before(grammarAccess.getDependanceFinishRule()); 
            pushFollow(FOLLOW_1);
            ruleDependanceFinish();

            state._fsp--;

             after(grammarAccess.getDependanceFinishRule()); 
            match(input,EOF,FOLLOW_2); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleDependanceFinish"


    // $ANTLR start "ruleDependanceFinish"
    // InternalPDL2.g:187:1: ruleDependanceFinish : ( ( rule__DependanceFinish__Group__0 ) ) ;
    public final void ruleDependanceFinish() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:191:2: ( ( ( rule__DependanceFinish__Group__0 ) ) )
            // InternalPDL2.g:192:2: ( ( rule__DependanceFinish__Group__0 ) )
            {
            // InternalPDL2.g:192:2: ( ( rule__DependanceFinish__Group__0 ) )
            // InternalPDL2.g:193:3: ( rule__DependanceFinish__Group__0 )
            {
             before(grammarAccess.getDependanceFinishAccess().getGroup()); 
            // InternalPDL2.g:194:3: ( rule__DependanceFinish__Group__0 )
            // InternalPDL2.g:194:4: rule__DependanceFinish__Group__0
            {
            pushFollow(FOLLOW_2);
            rule__DependanceFinish__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getDependanceFinishAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleDependanceFinish"


    // $ANTLR start "entryRuleWorkSequenceKindFinish"
    // InternalPDL2.g:203:1: entryRuleWorkSequenceKindFinish : ruleWorkSequenceKindFinish EOF ;
    public final void entryRuleWorkSequenceKindFinish() throws RecognitionException {
        try {
            // InternalPDL2.g:204:1: ( ruleWorkSequenceKindFinish EOF )
            // InternalPDL2.g:205:1: ruleWorkSequenceKindFinish EOF
            {
             before(grammarAccess.getWorkSequenceKindFinishRule()); 
            pushFollow(FOLLOW_1);
            ruleWorkSequenceKindFinish();

            state._fsp--;

             after(grammarAccess.getWorkSequenceKindFinishRule()); 
            match(input,EOF,FOLLOW_2); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleWorkSequenceKindFinish"


    // $ANTLR start "ruleWorkSequenceKindFinish"
    // InternalPDL2.g:212:1: ruleWorkSequenceKindFinish : ( ( rule__WorkSequenceKindFinish__Alternatives ) ) ;
    public final void ruleWorkSequenceKindFinish() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:216:2: ( ( ( rule__WorkSequenceKindFinish__Alternatives ) ) )
            // InternalPDL2.g:217:2: ( ( rule__WorkSequenceKindFinish__Alternatives ) )
            {
            // InternalPDL2.g:217:2: ( ( rule__WorkSequenceKindFinish__Alternatives ) )
            // InternalPDL2.g:218:3: ( rule__WorkSequenceKindFinish__Alternatives )
            {
             before(grammarAccess.getWorkSequenceKindFinishAccess().getAlternatives()); 
            // InternalPDL2.g:219:3: ( rule__WorkSequenceKindFinish__Alternatives )
            // InternalPDL2.g:219:4: rule__WorkSequenceKindFinish__Alternatives
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequenceKindFinish__Alternatives();

            state._fsp--;


            }

             after(grammarAccess.getWorkSequenceKindFinishAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleWorkSequenceKindFinish"


    // $ANTLR start "entryRuleGuidance"
    // InternalPDL2.g:228:1: entryRuleGuidance : ruleGuidance EOF ;
    public final void entryRuleGuidance() throws RecognitionException {
        try {
            // InternalPDL2.g:229:1: ( ruleGuidance EOF )
            // InternalPDL2.g:230:1: ruleGuidance EOF
            {
             before(grammarAccess.getGuidanceRule()); 
            pushFollow(FOLLOW_1);
            ruleGuidance();

            state._fsp--;

             after(grammarAccess.getGuidanceRule()); 
            match(input,EOF,FOLLOW_2); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "entryRuleGuidance"


    // $ANTLR start "ruleGuidance"
    // InternalPDL2.g:237:1: ruleGuidance : ( ( rule__Guidance__Group__0 ) ) ;
    public final void ruleGuidance() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:241:2: ( ( ( rule__Guidance__Group__0 ) ) )
            // InternalPDL2.g:242:2: ( ( rule__Guidance__Group__0 ) )
            {
            // InternalPDL2.g:242:2: ( ( rule__Guidance__Group__0 ) )
            // InternalPDL2.g:243:3: ( rule__Guidance__Group__0 )
            {
             before(grammarAccess.getGuidanceAccess().getGroup()); 
            // InternalPDL2.g:244:3: ( rule__Guidance__Group__0 )
            // InternalPDL2.g:244:4: rule__Guidance__Group__0
            {
            pushFollow(FOLLOW_2);
            rule__Guidance__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getGuidanceAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "ruleGuidance"


    // $ANTLR start "rule__ProcessElement__Alternatives"
    // InternalPDL2.g:252:1: rule__ProcessElement__Alternatives : ( ( ruleWorkDefinition ) | ( ruleGuidance ) );
    public final void rule__ProcessElement__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:256:1: ( ( ruleWorkDefinition ) | ( ruleGuidance ) )
            int alt1=2;
            int LA1_0 = input.LA(1);

            if ( (LA1_0==14) ) {
                alt1=1;
            }
            else if ( (LA1_0==18) ) {
                alt1=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 1, 0, input);

                throw nvae;
            }
            switch (alt1) {
                case 1 :
                    // InternalPDL2.g:257:2: ( ruleWorkDefinition )
                    {
                    // InternalPDL2.g:257:2: ( ruleWorkDefinition )
                    // InternalPDL2.g:258:3: ruleWorkDefinition
                    {
                     before(grammarAccess.getProcessElementAccess().getWorkDefinitionParserRuleCall_0()); 
                    pushFollow(FOLLOW_2);
                    ruleWorkDefinition();

                    state._fsp--;

                     after(grammarAccess.getProcessElementAccess().getWorkDefinitionParserRuleCall_0()); 

                    }


                    }
                    break;
                case 2 :
                    // InternalPDL2.g:263:2: ( ruleGuidance )
                    {
                    // InternalPDL2.g:263:2: ( ruleGuidance )
                    // InternalPDL2.g:264:3: ruleGuidance
                    {
                     before(grammarAccess.getProcessElementAccess().getGuidanceParserRuleCall_1()); 
                    pushFollow(FOLLOW_2);
                    ruleGuidance();

                    state._fsp--;

                     after(grammarAccess.getProcessElementAccess().getGuidanceParserRuleCall_1()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__ProcessElement__Alternatives"


    // $ANTLR start "rule__WorkSequenceKindStart__Alternatives"
    // InternalPDL2.g:273:1: rule__WorkSequenceKindStart__Alternatives : ( ( ( rule__WorkSequenceKindStart__Started2StartAssignment_0 ) ) | ( ( rule__WorkSequenceKindStart__Started2FinishAssignment_1 ) ) );
    public final void rule__WorkSequenceKindStart__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:277:1: ( ( ( rule__WorkSequenceKindStart__Started2StartAssignment_0 ) ) | ( ( rule__WorkSequenceKindStart__Started2FinishAssignment_1 ) ) )
            int alt2=2;
            int LA2_0 = input.LA(1);

            if ( (LA2_0==19) ) {
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
                    // InternalPDL2.g:278:2: ( ( rule__WorkSequenceKindStart__Started2StartAssignment_0 ) )
                    {
                    // InternalPDL2.g:278:2: ( ( rule__WorkSequenceKindStart__Started2StartAssignment_0 ) )
                    // InternalPDL2.g:279:3: ( rule__WorkSequenceKindStart__Started2StartAssignment_0 )
                    {
                     before(grammarAccess.getWorkSequenceKindStartAccess().getStarted2StartAssignment_0()); 
                    // InternalPDL2.g:280:3: ( rule__WorkSequenceKindStart__Started2StartAssignment_0 )
                    // InternalPDL2.g:280:4: rule__WorkSequenceKindStart__Started2StartAssignment_0
                    {
                    pushFollow(FOLLOW_2);
                    rule__WorkSequenceKindStart__Started2StartAssignment_0();

                    state._fsp--;


                    }

                     after(grammarAccess.getWorkSequenceKindStartAccess().getStarted2StartAssignment_0()); 

                    }


                    }
                    break;
                case 2 :
                    // InternalPDL2.g:284:2: ( ( rule__WorkSequenceKindStart__Started2FinishAssignment_1 ) )
                    {
                    // InternalPDL2.g:284:2: ( ( rule__WorkSequenceKindStart__Started2FinishAssignment_1 ) )
                    // InternalPDL2.g:285:3: ( rule__WorkSequenceKindStart__Started2FinishAssignment_1 )
                    {
                     before(grammarAccess.getWorkSequenceKindStartAccess().getStarted2FinishAssignment_1()); 
                    // InternalPDL2.g:286:3: ( rule__WorkSequenceKindStart__Started2FinishAssignment_1 )
                    // InternalPDL2.g:286:4: rule__WorkSequenceKindStart__Started2FinishAssignment_1
                    {
                    pushFollow(FOLLOW_2);
                    rule__WorkSequenceKindStart__Started2FinishAssignment_1();

                    state._fsp--;


                    }

                     after(grammarAccess.getWorkSequenceKindStartAccess().getStarted2FinishAssignment_1()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkSequenceKindStart__Alternatives"


    // $ANTLR start "rule__WorkSequenceKindFinish__Alternatives"
    // InternalPDL2.g:294:1: rule__WorkSequenceKindFinish__Alternatives : ( ( ( rule__WorkSequenceKindFinish__Finished2StartAssignment_0 ) ) | ( ( rule__WorkSequenceKindFinish__Finished2FinishAssignment_1 ) ) );
    public final void rule__WorkSequenceKindFinish__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:298:1: ( ( ( rule__WorkSequenceKindFinish__Finished2StartAssignment_0 ) ) | ( ( rule__WorkSequenceKindFinish__Finished2FinishAssignment_1 ) ) )
            int alt3=2;
            int LA3_0 = input.LA(1);

            if ( (LA3_0==19) ) {
                alt3=1;
            }
            else if ( (LA3_0==20) ) {
                alt3=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 3, 0, input);

                throw nvae;
            }
            switch (alt3) {
                case 1 :
                    // InternalPDL2.g:299:2: ( ( rule__WorkSequenceKindFinish__Finished2StartAssignment_0 ) )
                    {
                    // InternalPDL2.g:299:2: ( ( rule__WorkSequenceKindFinish__Finished2StartAssignment_0 ) )
                    // InternalPDL2.g:300:3: ( rule__WorkSequenceKindFinish__Finished2StartAssignment_0 )
                    {
                     before(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2StartAssignment_0()); 
                    // InternalPDL2.g:301:3: ( rule__WorkSequenceKindFinish__Finished2StartAssignment_0 )
                    // InternalPDL2.g:301:4: rule__WorkSequenceKindFinish__Finished2StartAssignment_0
                    {
                    pushFollow(FOLLOW_2);
                    rule__WorkSequenceKindFinish__Finished2StartAssignment_0();

                    state._fsp--;


                    }

                     after(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2StartAssignment_0()); 

                    }


                    }
                    break;
                case 2 :
                    // InternalPDL2.g:305:2: ( ( rule__WorkSequenceKindFinish__Finished2FinishAssignment_1 ) )
                    {
                    // InternalPDL2.g:305:2: ( ( rule__WorkSequenceKindFinish__Finished2FinishAssignment_1 ) )
                    // InternalPDL2.g:306:3: ( rule__WorkSequenceKindFinish__Finished2FinishAssignment_1 )
                    {
                     before(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2FinishAssignment_1()); 
                    // InternalPDL2.g:307:3: ( rule__WorkSequenceKindFinish__Finished2FinishAssignment_1 )
                    // InternalPDL2.g:307:4: rule__WorkSequenceKindFinish__Finished2FinishAssignment_1
                    {
                    pushFollow(FOLLOW_2);
                    rule__WorkSequenceKindFinish__Finished2FinishAssignment_1();

                    state._fsp--;


                    }

                     after(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2FinishAssignment_1()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkSequenceKindFinish__Alternatives"


    // $ANTLR start "rule__Process__Group__0"
    // InternalPDL2.g:315:1: rule__Process__Group__0 : rule__Process__Group__0__Impl rule__Process__Group__1 ;
    public final void rule__Process__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:319:1: ( rule__Process__Group__0__Impl rule__Process__Group__1 )
            // InternalPDL2.g:320:2: rule__Process__Group__0__Impl rule__Process__Group__1
            {
            pushFollow(FOLLOW_3);
            rule__Process__Group__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__Process__Group__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__0"


    // $ANTLR start "rule__Process__Group__0__Impl"
    // InternalPDL2.g:327:1: rule__Process__Group__0__Impl : ( 'process' ) ;
    public final void rule__Process__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:331:1: ( ( 'process' ) )
            // InternalPDL2.g:332:1: ( 'process' )
            {
            // InternalPDL2.g:332:1: ( 'process' )
            // InternalPDL2.g:333:2: 'process'
            {
             before(grammarAccess.getProcessAccess().getProcessKeyword_0()); 
            match(input,11,FOLLOW_2); 
             after(grammarAccess.getProcessAccess().getProcessKeyword_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__0__Impl"


    // $ANTLR start "rule__Process__Group__1"
    // InternalPDL2.g:342:1: rule__Process__Group__1 : rule__Process__Group__1__Impl rule__Process__Group__2 ;
    public final void rule__Process__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:346:1: ( rule__Process__Group__1__Impl rule__Process__Group__2 )
            // InternalPDL2.g:347:2: rule__Process__Group__1__Impl rule__Process__Group__2
            {
            pushFollow(FOLLOW_4);
            rule__Process__Group__1__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__Process__Group__2();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__1"


    // $ANTLR start "rule__Process__Group__1__Impl"
    // InternalPDL2.g:354:1: rule__Process__Group__1__Impl : ( ( rule__Process__NameAssignment_1 ) ) ;
    public final void rule__Process__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:358:1: ( ( ( rule__Process__NameAssignment_1 ) ) )
            // InternalPDL2.g:359:1: ( ( rule__Process__NameAssignment_1 ) )
            {
            // InternalPDL2.g:359:1: ( ( rule__Process__NameAssignment_1 ) )
            // InternalPDL2.g:360:2: ( rule__Process__NameAssignment_1 )
            {
             before(grammarAccess.getProcessAccess().getNameAssignment_1()); 
            // InternalPDL2.g:361:2: ( rule__Process__NameAssignment_1 )
            // InternalPDL2.g:361:3: rule__Process__NameAssignment_1
            {
            pushFollow(FOLLOW_2);
            rule__Process__NameAssignment_1();

            state._fsp--;


            }

             after(grammarAccess.getProcessAccess().getNameAssignment_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__1__Impl"


    // $ANTLR start "rule__Process__Group__2"
    // InternalPDL2.g:369:1: rule__Process__Group__2 : rule__Process__Group__2__Impl rule__Process__Group__3 ;
    public final void rule__Process__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:373:1: ( rule__Process__Group__2__Impl rule__Process__Group__3 )
            // InternalPDL2.g:374:2: rule__Process__Group__2__Impl rule__Process__Group__3
            {
            pushFollow(FOLLOW_5);
            rule__Process__Group__2__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__Process__Group__3();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__2"


    // $ANTLR start "rule__Process__Group__2__Impl"
    // InternalPDL2.g:381:1: rule__Process__Group__2__Impl : ( '{' ) ;
    public final void rule__Process__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:385:1: ( ( '{' ) )
            // InternalPDL2.g:386:1: ( '{' )
            {
            // InternalPDL2.g:386:1: ( '{' )
            // InternalPDL2.g:387:2: '{'
            {
             before(grammarAccess.getProcessAccess().getLeftCurlyBracketKeyword_2()); 
            match(input,12,FOLLOW_2); 
             after(grammarAccess.getProcessAccess().getLeftCurlyBracketKeyword_2()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__2__Impl"


    // $ANTLR start "rule__Process__Group__3"
    // InternalPDL2.g:396:1: rule__Process__Group__3 : rule__Process__Group__3__Impl rule__Process__Group__4 ;
    public final void rule__Process__Group__3() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:400:1: ( rule__Process__Group__3__Impl rule__Process__Group__4 )
            // InternalPDL2.g:401:2: rule__Process__Group__3__Impl rule__Process__Group__4
            {
            pushFollow(FOLLOW_5);
            rule__Process__Group__3__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__Process__Group__4();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__3"


    // $ANTLR start "rule__Process__Group__3__Impl"
    // InternalPDL2.g:408:1: rule__Process__Group__3__Impl : ( ( rule__Process__ProcessElementsAssignment_3 )* ) ;
    public final void rule__Process__Group__3__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:412:1: ( ( ( rule__Process__ProcessElementsAssignment_3 )* ) )
            // InternalPDL2.g:413:1: ( ( rule__Process__ProcessElementsAssignment_3 )* )
            {
            // InternalPDL2.g:413:1: ( ( rule__Process__ProcessElementsAssignment_3 )* )
            // InternalPDL2.g:414:2: ( rule__Process__ProcessElementsAssignment_3 )*
            {
             before(grammarAccess.getProcessAccess().getProcessElementsAssignment_3()); 
            // InternalPDL2.g:415:2: ( rule__Process__ProcessElementsAssignment_3 )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);

                if ( (LA4_0==14||LA4_0==18) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // InternalPDL2.g:415:3: rule__Process__ProcessElementsAssignment_3
            	    {
            	    pushFollow(FOLLOW_6);
            	    rule__Process__ProcessElementsAssignment_3();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop4;
                }
            } while (true);

             after(grammarAccess.getProcessAccess().getProcessElementsAssignment_3()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__3__Impl"


    // $ANTLR start "rule__Process__Group__4"
    // InternalPDL2.g:423:1: rule__Process__Group__4 : rule__Process__Group__4__Impl ;
    public final void rule__Process__Group__4() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:427:1: ( rule__Process__Group__4__Impl )
            // InternalPDL2.g:428:2: rule__Process__Group__4__Impl
            {
            pushFollow(FOLLOW_2);
            rule__Process__Group__4__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__4"


    // $ANTLR start "rule__Process__Group__4__Impl"
    // InternalPDL2.g:434:1: rule__Process__Group__4__Impl : ( '}' ) ;
    public final void rule__Process__Group__4__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:438:1: ( ( '}' ) )
            // InternalPDL2.g:439:1: ( '}' )
            {
            // InternalPDL2.g:439:1: ( '}' )
            // InternalPDL2.g:440:2: '}'
            {
             before(grammarAccess.getProcessAccess().getRightCurlyBracketKeyword_4()); 
            match(input,13,FOLLOW_2); 
             after(grammarAccess.getProcessAccess().getRightCurlyBracketKeyword_4()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__4__Impl"


    // $ANTLR start "rule__WorkDefinition__Group__0"
    // InternalPDL2.g:450:1: rule__WorkDefinition__Group__0 : rule__WorkDefinition__Group__0__Impl rule__WorkDefinition__Group__1 ;
    public final void rule__WorkDefinition__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:454:1: ( rule__WorkDefinition__Group__0__Impl rule__WorkDefinition__Group__1 )
            // InternalPDL2.g:455:2: rule__WorkDefinition__Group__0__Impl rule__WorkDefinition__Group__1
            {
            pushFollow(FOLLOW_3);
            rule__WorkDefinition__Group__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__0"


    // $ANTLR start "rule__WorkDefinition__Group__0__Impl"
    // InternalPDL2.g:462:1: rule__WorkDefinition__Group__0__Impl : ( 'wd' ) ;
    public final void rule__WorkDefinition__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:466:1: ( ( 'wd' ) )
            // InternalPDL2.g:467:1: ( 'wd' )
            {
            // InternalPDL2.g:467:1: ( 'wd' )
            // InternalPDL2.g:468:2: 'wd'
            {
             before(grammarAccess.getWorkDefinitionAccess().getWdKeyword_0()); 
            match(input,14,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getWdKeyword_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__0__Impl"


    // $ANTLR start "rule__WorkDefinition__Group__1"
    // InternalPDL2.g:477:1: rule__WorkDefinition__Group__1 : rule__WorkDefinition__Group__1__Impl rule__WorkDefinition__Group__2 ;
    public final void rule__WorkDefinition__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:481:1: ( rule__WorkDefinition__Group__1__Impl rule__WorkDefinition__Group__2 )
            // InternalPDL2.g:482:2: rule__WorkDefinition__Group__1__Impl rule__WorkDefinition__Group__2
            {
            pushFollow(FOLLOW_4);
            rule__WorkDefinition__Group__1__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group__2();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__1"


    // $ANTLR start "rule__WorkDefinition__Group__1__Impl"
    // InternalPDL2.g:489:1: rule__WorkDefinition__Group__1__Impl : ( ( rule__WorkDefinition__NameAssignment_1 ) ) ;
    public final void rule__WorkDefinition__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:493:1: ( ( ( rule__WorkDefinition__NameAssignment_1 ) ) )
            // InternalPDL2.g:494:1: ( ( rule__WorkDefinition__NameAssignment_1 ) )
            {
            // InternalPDL2.g:494:1: ( ( rule__WorkDefinition__NameAssignment_1 ) )
            // InternalPDL2.g:495:2: ( rule__WorkDefinition__NameAssignment_1 )
            {
             before(grammarAccess.getWorkDefinitionAccess().getNameAssignment_1()); 
            // InternalPDL2.g:496:2: ( rule__WorkDefinition__NameAssignment_1 )
            // InternalPDL2.g:496:3: rule__WorkDefinition__NameAssignment_1
            {
            pushFollow(FOLLOW_2);
            rule__WorkDefinition__NameAssignment_1();

            state._fsp--;


            }

             after(grammarAccess.getWorkDefinitionAccess().getNameAssignment_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__1__Impl"


    // $ANTLR start "rule__WorkDefinition__Group__2"
    // InternalPDL2.g:504:1: rule__WorkDefinition__Group__2 : rule__WorkDefinition__Group__2__Impl rule__WorkDefinition__Group__3 ;
    public final void rule__WorkDefinition__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:508:1: ( rule__WorkDefinition__Group__2__Impl rule__WorkDefinition__Group__3 )
            // InternalPDL2.g:509:2: rule__WorkDefinition__Group__2__Impl rule__WorkDefinition__Group__3
            {
            pushFollow(FOLLOW_7);
            rule__WorkDefinition__Group__2__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group__3();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__2"


    // $ANTLR start "rule__WorkDefinition__Group__2__Impl"
    // InternalPDL2.g:516:1: rule__WorkDefinition__Group__2__Impl : ( '{' ) ;
    public final void rule__WorkDefinition__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:520:1: ( ( '{' ) )
            // InternalPDL2.g:521:1: ( '{' )
            {
            // InternalPDL2.g:521:1: ( '{' )
            // InternalPDL2.g:522:2: '{'
            {
             before(grammarAccess.getWorkDefinitionAccess().getLeftCurlyBracketKeyword_2()); 
            match(input,12,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getLeftCurlyBracketKeyword_2()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__2__Impl"


    // $ANTLR start "rule__WorkDefinition__Group__3"
    // InternalPDL2.g:531:1: rule__WorkDefinition__Group__3 : rule__WorkDefinition__Group__3__Impl rule__WorkDefinition__Group__4 ;
    public final void rule__WorkDefinition__Group__3() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:535:1: ( rule__WorkDefinition__Group__3__Impl rule__WorkDefinition__Group__4 )
            // InternalPDL2.g:536:2: rule__WorkDefinition__Group__3__Impl rule__WorkDefinition__Group__4
            {
            pushFollow(FOLLOW_7);
            rule__WorkDefinition__Group__3__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group__4();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__3"


    // $ANTLR start "rule__WorkDefinition__Group__3__Impl"
    // InternalPDL2.g:543:1: rule__WorkDefinition__Group__3__Impl : ( ( rule__WorkDefinition__Group_3__0 )? ) ;
    public final void rule__WorkDefinition__Group__3__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:547:1: ( ( ( rule__WorkDefinition__Group_3__0 )? ) )
            // InternalPDL2.g:548:1: ( ( rule__WorkDefinition__Group_3__0 )? )
            {
            // InternalPDL2.g:548:1: ( ( rule__WorkDefinition__Group_3__0 )? )
            // InternalPDL2.g:549:2: ( rule__WorkDefinition__Group_3__0 )?
            {
             before(grammarAccess.getWorkDefinitionAccess().getGroup_3()); 
            // InternalPDL2.g:550:2: ( rule__WorkDefinition__Group_3__0 )?
            int alt5=2;
            int LA5_0 = input.LA(1);

            if ( (LA5_0==15) ) {
                alt5=1;
            }
            switch (alt5) {
                case 1 :
                    // InternalPDL2.g:550:3: rule__WorkDefinition__Group_3__0
                    {
                    pushFollow(FOLLOW_2);
                    rule__WorkDefinition__Group_3__0();

                    state._fsp--;


                    }
                    break;

            }

             after(grammarAccess.getWorkDefinitionAccess().getGroup_3()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__3__Impl"


    // $ANTLR start "rule__WorkDefinition__Group__4"
    // InternalPDL2.g:558:1: rule__WorkDefinition__Group__4 : rule__WorkDefinition__Group__4__Impl rule__WorkDefinition__Group__5 ;
    public final void rule__WorkDefinition__Group__4() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:562:1: ( rule__WorkDefinition__Group__4__Impl rule__WorkDefinition__Group__5 )
            // InternalPDL2.g:563:2: rule__WorkDefinition__Group__4__Impl rule__WorkDefinition__Group__5
            {
            pushFollow(FOLLOW_7);
            rule__WorkDefinition__Group__4__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group__5();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__4"


    // $ANTLR start "rule__WorkDefinition__Group__4__Impl"
    // InternalPDL2.g:570:1: rule__WorkDefinition__Group__4__Impl : ( ( rule__WorkDefinition__Group_4__0 )? ) ;
    public final void rule__WorkDefinition__Group__4__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:574:1: ( ( ( rule__WorkDefinition__Group_4__0 )? ) )
            // InternalPDL2.g:575:1: ( ( rule__WorkDefinition__Group_4__0 )? )
            {
            // InternalPDL2.g:575:1: ( ( rule__WorkDefinition__Group_4__0 )? )
            // InternalPDL2.g:576:2: ( rule__WorkDefinition__Group_4__0 )?
            {
             before(grammarAccess.getWorkDefinitionAccess().getGroup_4()); 
            // InternalPDL2.g:577:2: ( rule__WorkDefinition__Group_4__0 )?
            int alt6=2;
            int LA6_0 = input.LA(1);

            if ( (LA6_0==17) ) {
                alt6=1;
            }
            switch (alt6) {
                case 1 :
                    // InternalPDL2.g:577:3: rule__WorkDefinition__Group_4__0
                    {
                    pushFollow(FOLLOW_2);
                    rule__WorkDefinition__Group_4__0();

                    state._fsp--;


                    }
                    break;

            }

             after(grammarAccess.getWorkDefinitionAccess().getGroup_4()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__4__Impl"


    // $ANTLR start "rule__WorkDefinition__Group__5"
    // InternalPDL2.g:585:1: rule__WorkDefinition__Group__5 : rule__WorkDefinition__Group__5__Impl ;
    public final void rule__WorkDefinition__Group__5() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:589:1: ( rule__WorkDefinition__Group__5__Impl )
            // InternalPDL2.g:590:2: rule__WorkDefinition__Group__5__Impl
            {
            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group__5__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__5"


    // $ANTLR start "rule__WorkDefinition__Group__5__Impl"
    // InternalPDL2.g:596:1: rule__WorkDefinition__Group__5__Impl : ( '}' ) ;
    public final void rule__WorkDefinition__Group__5__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:600:1: ( ( '}' ) )
            // InternalPDL2.g:601:1: ( '}' )
            {
            // InternalPDL2.g:601:1: ( '}' )
            // InternalPDL2.g:602:2: '}'
            {
             before(grammarAccess.getWorkDefinitionAccess().getRightCurlyBracketKeyword_5()); 
            match(input,13,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getRightCurlyBracketKeyword_5()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__5__Impl"


    // $ANTLR start "rule__WorkDefinition__Group_3__0"
    // InternalPDL2.g:612:1: rule__WorkDefinition__Group_3__0 : rule__WorkDefinition__Group_3__0__Impl rule__WorkDefinition__Group_3__1 ;
    public final void rule__WorkDefinition__Group_3__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:616:1: ( rule__WorkDefinition__Group_3__0__Impl rule__WorkDefinition__Group_3__1 )
            // InternalPDL2.g:617:2: rule__WorkDefinition__Group_3__0__Impl rule__WorkDefinition__Group_3__1
            {
            pushFollow(FOLLOW_8);
            rule__WorkDefinition__Group_3__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group_3__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_3__0"


    // $ANTLR start "rule__WorkDefinition__Group_3__0__Impl"
    // InternalPDL2.g:624:1: rule__WorkDefinition__Group_3__0__Impl : ( 'starts' ) ;
    public final void rule__WorkDefinition__Group_3__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:628:1: ( ( 'starts' ) )
            // InternalPDL2.g:629:1: ( 'starts' )
            {
            // InternalPDL2.g:629:1: ( 'starts' )
            // InternalPDL2.g:630:2: 'starts'
            {
             before(grammarAccess.getWorkDefinitionAccess().getStartsKeyword_3_0()); 
            match(input,15,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getStartsKeyword_3_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_3__0__Impl"


    // $ANTLR start "rule__WorkDefinition__Group_3__1"
    // InternalPDL2.g:639:1: rule__WorkDefinition__Group_3__1 : rule__WorkDefinition__Group_3__1__Impl rule__WorkDefinition__Group_3__2 ;
    public final void rule__WorkDefinition__Group_3__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:643:1: ( rule__WorkDefinition__Group_3__1__Impl rule__WorkDefinition__Group_3__2 )
            // InternalPDL2.g:644:2: rule__WorkDefinition__Group_3__1__Impl rule__WorkDefinition__Group_3__2
            {
            pushFollow(FOLLOW_3);
            rule__WorkDefinition__Group_3__1__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group_3__2();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_3__1"


    // $ANTLR start "rule__WorkDefinition__Group_3__1__Impl"
    // InternalPDL2.g:651:1: rule__WorkDefinition__Group_3__1__Impl : ( 'if' ) ;
    public final void rule__WorkDefinition__Group_3__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:655:1: ( ( 'if' ) )
            // InternalPDL2.g:656:1: ( 'if' )
            {
            // InternalPDL2.g:656:1: ( 'if' )
            // InternalPDL2.g:657:2: 'if'
            {
             before(grammarAccess.getWorkDefinitionAccess().getIfKeyword_3_1()); 
            match(input,16,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getIfKeyword_3_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_3__1__Impl"


    // $ANTLR start "rule__WorkDefinition__Group_3__2"
    // InternalPDL2.g:666:1: rule__WorkDefinition__Group_3__2 : rule__WorkDefinition__Group_3__2__Impl ;
    public final void rule__WorkDefinition__Group_3__2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:670:1: ( rule__WorkDefinition__Group_3__2__Impl )
            // InternalPDL2.g:671:2: rule__WorkDefinition__Group_3__2__Impl
            {
            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group_3__2__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_3__2"


    // $ANTLR start "rule__WorkDefinition__Group_3__2__Impl"
    // InternalPDL2.g:677:1: rule__WorkDefinition__Group_3__2__Impl : ( ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 ) ) ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 )* ) ) ;
    public final void rule__WorkDefinition__Group_3__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:681:1: ( ( ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 ) ) ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 )* ) ) )
            // InternalPDL2.g:682:1: ( ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 ) ) ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 )* ) )
            {
            // InternalPDL2.g:682:1: ( ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 ) ) ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 )* ) )
            // InternalPDL2.g:683:2: ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 ) ) ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 )* )
            {
            // InternalPDL2.g:683:2: ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 ) )
            // InternalPDL2.g:684:3: ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 )
            {
             before(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsAssignment_3_2()); 
            // InternalPDL2.g:685:3: ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 )
            // InternalPDL2.g:685:4: rule__WorkDefinition__LinksToPredecessorsAssignment_3_2
            {
            pushFollow(FOLLOW_9);
            rule__WorkDefinition__LinksToPredecessorsAssignment_3_2();

            state._fsp--;


            }

             after(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsAssignment_3_2()); 

            }

            // InternalPDL2.g:688:2: ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 )* )
            // InternalPDL2.g:689:3: ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 )*
            {
             before(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsAssignment_3_2()); 
            // InternalPDL2.g:690:3: ( rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 )*
            loop7:
            do {
                int alt7=2;
                int LA7_0 = input.LA(1);

                if ( (LA7_0==RULE_ID) ) {
                    alt7=1;
                }


                switch (alt7) {
            	case 1 :
            	    // InternalPDL2.g:690:4: rule__WorkDefinition__LinksToPredecessorsAssignment_3_2
            	    {
            	    pushFollow(FOLLOW_9);
            	    rule__WorkDefinition__LinksToPredecessorsAssignment_3_2();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop7;
                }
            } while (true);

             after(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsAssignment_3_2()); 

            }


            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_3__2__Impl"


    // $ANTLR start "rule__WorkDefinition__Group_4__0"
    // InternalPDL2.g:700:1: rule__WorkDefinition__Group_4__0 : rule__WorkDefinition__Group_4__0__Impl rule__WorkDefinition__Group_4__1 ;
    public final void rule__WorkDefinition__Group_4__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:704:1: ( rule__WorkDefinition__Group_4__0__Impl rule__WorkDefinition__Group_4__1 )
            // InternalPDL2.g:705:2: rule__WorkDefinition__Group_4__0__Impl rule__WorkDefinition__Group_4__1
            {
            pushFollow(FOLLOW_8);
            rule__WorkDefinition__Group_4__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group_4__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_4__0"


    // $ANTLR start "rule__WorkDefinition__Group_4__0__Impl"
    // InternalPDL2.g:712:1: rule__WorkDefinition__Group_4__0__Impl : ( 'finishes' ) ;
    public final void rule__WorkDefinition__Group_4__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:716:1: ( ( 'finishes' ) )
            // InternalPDL2.g:717:1: ( 'finishes' )
            {
            // InternalPDL2.g:717:1: ( 'finishes' )
            // InternalPDL2.g:718:2: 'finishes'
            {
             before(grammarAccess.getWorkDefinitionAccess().getFinishesKeyword_4_0()); 
            match(input,17,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getFinishesKeyword_4_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_4__0__Impl"


    // $ANTLR start "rule__WorkDefinition__Group_4__1"
    // InternalPDL2.g:727:1: rule__WorkDefinition__Group_4__1 : rule__WorkDefinition__Group_4__1__Impl rule__WorkDefinition__Group_4__2 ;
    public final void rule__WorkDefinition__Group_4__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:731:1: ( rule__WorkDefinition__Group_4__1__Impl rule__WorkDefinition__Group_4__2 )
            // InternalPDL2.g:732:2: rule__WorkDefinition__Group_4__1__Impl rule__WorkDefinition__Group_4__2
            {
            pushFollow(FOLLOW_3);
            rule__WorkDefinition__Group_4__1__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group_4__2();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_4__1"


    // $ANTLR start "rule__WorkDefinition__Group_4__1__Impl"
    // InternalPDL2.g:739:1: rule__WorkDefinition__Group_4__1__Impl : ( 'if' ) ;
    public final void rule__WorkDefinition__Group_4__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:743:1: ( ( 'if' ) )
            // InternalPDL2.g:744:1: ( 'if' )
            {
            // InternalPDL2.g:744:1: ( 'if' )
            // InternalPDL2.g:745:2: 'if'
            {
             before(grammarAccess.getWorkDefinitionAccess().getIfKeyword_4_1()); 
            match(input,16,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getIfKeyword_4_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_4__1__Impl"


    // $ANTLR start "rule__WorkDefinition__Group_4__2"
    // InternalPDL2.g:754:1: rule__WorkDefinition__Group_4__2 : rule__WorkDefinition__Group_4__2__Impl ;
    public final void rule__WorkDefinition__Group_4__2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:758:1: ( rule__WorkDefinition__Group_4__2__Impl )
            // InternalPDL2.g:759:2: rule__WorkDefinition__Group_4__2__Impl
            {
            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group_4__2__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_4__2"


    // $ANTLR start "rule__WorkDefinition__Group_4__2__Impl"
    // InternalPDL2.g:765:1: rule__WorkDefinition__Group_4__2__Impl : ( ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 ) ) ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 )* ) ) ;
    public final void rule__WorkDefinition__Group_4__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:769:1: ( ( ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 ) ) ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 )* ) ) )
            // InternalPDL2.g:770:1: ( ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 ) ) ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 )* ) )
            {
            // InternalPDL2.g:770:1: ( ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 ) ) ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 )* ) )
            // InternalPDL2.g:771:2: ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 ) ) ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 )* )
            {
            // InternalPDL2.g:771:2: ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 ) )
            // InternalPDL2.g:772:3: ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 )
            {
             before(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsAssignment_4_2()); 
            // InternalPDL2.g:773:3: ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 )
            // InternalPDL2.g:773:4: rule__WorkDefinition__LinksToPredecessorsAssignment_4_2
            {
            pushFollow(FOLLOW_9);
            rule__WorkDefinition__LinksToPredecessorsAssignment_4_2();

            state._fsp--;


            }

             after(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsAssignment_4_2()); 

            }

            // InternalPDL2.g:776:2: ( ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 )* )
            // InternalPDL2.g:777:3: ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 )*
            {
             before(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsAssignment_4_2()); 
            // InternalPDL2.g:778:3: ( rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 )*
            loop8:
            do {
                int alt8=2;
                int LA8_0 = input.LA(1);

                if ( (LA8_0==RULE_ID) ) {
                    alt8=1;
                }


                switch (alt8) {
            	case 1 :
            	    // InternalPDL2.g:778:4: rule__WorkDefinition__LinksToPredecessorsAssignment_4_2
            	    {
            	    pushFollow(FOLLOW_9);
            	    rule__WorkDefinition__LinksToPredecessorsAssignment_4_2();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop8;
                }
            } while (true);

             after(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsAssignment_4_2()); 

            }


            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group_4__2__Impl"


    // $ANTLR start "rule__DependanceStart__Group__0"
    // InternalPDL2.g:788:1: rule__DependanceStart__Group__0 : rule__DependanceStart__Group__0__Impl rule__DependanceStart__Group__1 ;
    public final void rule__DependanceStart__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:792:1: ( rule__DependanceStart__Group__0__Impl rule__DependanceStart__Group__1 )
            // InternalPDL2.g:793:2: rule__DependanceStart__Group__0__Impl rule__DependanceStart__Group__1
            {
            pushFollow(FOLLOW_10);
            rule__DependanceStart__Group__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__DependanceStart__Group__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceStart__Group__0"


    // $ANTLR start "rule__DependanceStart__Group__0__Impl"
    // InternalPDL2.g:800:1: rule__DependanceStart__Group__0__Impl : ( ( rule__DependanceStart__PredecessorAssignment_0 ) ) ;
    public final void rule__DependanceStart__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:804:1: ( ( ( rule__DependanceStart__PredecessorAssignment_0 ) ) )
            // InternalPDL2.g:805:1: ( ( rule__DependanceStart__PredecessorAssignment_0 ) )
            {
            // InternalPDL2.g:805:1: ( ( rule__DependanceStart__PredecessorAssignment_0 ) )
            // InternalPDL2.g:806:2: ( rule__DependanceStart__PredecessorAssignment_0 )
            {
             before(grammarAccess.getDependanceStartAccess().getPredecessorAssignment_0()); 
            // InternalPDL2.g:807:2: ( rule__DependanceStart__PredecessorAssignment_0 )
            // InternalPDL2.g:807:3: rule__DependanceStart__PredecessorAssignment_0
            {
            pushFollow(FOLLOW_2);
            rule__DependanceStart__PredecessorAssignment_0();

            state._fsp--;


            }

             after(grammarAccess.getDependanceStartAccess().getPredecessorAssignment_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceStart__Group__0__Impl"


    // $ANTLR start "rule__DependanceStart__Group__1"
    // InternalPDL2.g:815:1: rule__DependanceStart__Group__1 : rule__DependanceStart__Group__1__Impl ;
    public final void rule__DependanceStart__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:819:1: ( rule__DependanceStart__Group__1__Impl )
            // InternalPDL2.g:820:2: rule__DependanceStart__Group__1__Impl
            {
            pushFollow(FOLLOW_2);
            rule__DependanceStart__Group__1__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceStart__Group__1"


    // $ANTLR start "rule__DependanceStart__Group__1__Impl"
    // InternalPDL2.g:826:1: rule__DependanceStart__Group__1__Impl : ( ( rule__DependanceStart__LinkAssignment_1 ) ) ;
    public final void rule__DependanceStart__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:830:1: ( ( ( rule__DependanceStart__LinkAssignment_1 ) ) )
            // InternalPDL2.g:831:1: ( ( rule__DependanceStart__LinkAssignment_1 ) )
            {
            // InternalPDL2.g:831:1: ( ( rule__DependanceStart__LinkAssignment_1 ) )
            // InternalPDL2.g:832:2: ( rule__DependanceStart__LinkAssignment_1 )
            {
             before(grammarAccess.getDependanceStartAccess().getLinkAssignment_1()); 
            // InternalPDL2.g:833:2: ( rule__DependanceStart__LinkAssignment_1 )
            // InternalPDL2.g:833:3: rule__DependanceStart__LinkAssignment_1
            {
            pushFollow(FOLLOW_2);
            rule__DependanceStart__LinkAssignment_1();

            state._fsp--;


            }

             after(grammarAccess.getDependanceStartAccess().getLinkAssignment_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceStart__Group__1__Impl"


    // $ANTLR start "rule__DependanceFinish__Group__0"
    // InternalPDL2.g:842:1: rule__DependanceFinish__Group__0 : rule__DependanceFinish__Group__0__Impl rule__DependanceFinish__Group__1 ;
    public final void rule__DependanceFinish__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:846:1: ( rule__DependanceFinish__Group__0__Impl rule__DependanceFinish__Group__1 )
            // InternalPDL2.g:847:2: rule__DependanceFinish__Group__0__Impl rule__DependanceFinish__Group__1
            {
            pushFollow(FOLLOW_10);
            rule__DependanceFinish__Group__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__DependanceFinish__Group__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceFinish__Group__0"


    // $ANTLR start "rule__DependanceFinish__Group__0__Impl"
    // InternalPDL2.g:854:1: rule__DependanceFinish__Group__0__Impl : ( ( rule__DependanceFinish__PredecessorAssignment_0 ) ) ;
    public final void rule__DependanceFinish__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:858:1: ( ( ( rule__DependanceFinish__PredecessorAssignment_0 ) ) )
            // InternalPDL2.g:859:1: ( ( rule__DependanceFinish__PredecessorAssignment_0 ) )
            {
            // InternalPDL2.g:859:1: ( ( rule__DependanceFinish__PredecessorAssignment_0 ) )
            // InternalPDL2.g:860:2: ( rule__DependanceFinish__PredecessorAssignment_0 )
            {
             before(grammarAccess.getDependanceFinishAccess().getPredecessorAssignment_0()); 
            // InternalPDL2.g:861:2: ( rule__DependanceFinish__PredecessorAssignment_0 )
            // InternalPDL2.g:861:3: rule__DependanceFinish__PredecessorAssignment_0
            {
            pushFollow(FOLLOW_2);
            rule__DependanceFinish__PredecessorAssignment_0();

            state._fsp--;


            }

             after(grammarAccess.getDependanceFinishAccess().getPredecessorAssignment_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceFinish__Group__0__Impl"


    // $ANTLR start "rule__DependanceFinish__Group__1"
    // InternalPDL2.g:869:1: rule__DependanceFinish__Group__1 : rule__DependanceFinish__Group__1__Impl ;
    public final void rule__DependanceFinish__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:873:1: ( rule__DependanceFinish__Group__1__Impl )
            // InternalPDL2.g:874:2: rule__DependanceFinish__Group__1__Impl
            {
            pushFollow(FOLLOW_2);
            rule__DependanceFinish__Group__1__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceFinish__Group__1"


    // $ANTLR start "rule__DependanceFinish__Group__1__Impl"
    // InternalPDL2.g:880:1: rule__DependanceFinish__Group__1__Impl : ( ( rule__DependanceFinish__LinkAssignment_1 ) ) ;
    public final void rule__DependanceFinish__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:884:1: ( ( ( rule__DependanceFinish__LinkAssignment_1 ) ) )
            // InternalPDL2.g:885:1: ( ( rule__DependanceFinish__LinkAssignment_1 ) )
            {
            // InternalPDL2.g:885:1: ( ( rule__DependanceFinish__LinkAssignment_1 ) )
            // InternalPDL2.g:886:2: ( rule__DependanceFinish__LinkAssignment_1 )
            {
             before(grammarAccess.getDependanceFinishAccess().getLinkAssignment_1()); 
            // InternalPDL2.g:887:2: ( rule__DependanceFinish__LinkAssignment_1 )
            // InternalPDL2.g:887:3: rule__DependanceFinish__LinkAssignment_1
            {
            pushFollow(FOLLOW_2);
            rule__DependanceFinish__LinkAssignment_1();

            state._fsp--;


            }

             after(grammarAccess.getDependanceFinishAccess().getLinkAssignment_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceFinish__Group__1__Impl"


    // $ANTLR start "rule__Guidance__Group__0"
    // InternalPDL2.g:896:1: rule__Guidance__Group__0 : rule__Guidance__Group__0__Impl rule__Guidance__Group__1 ;
    public final void rule__Guidance__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:900:1: ( rule__Guidance__Group__0__Impl rule__Guidance__Group__1 )
            // InternalPDL2.g:901:2: rule__Guidance__Group__0__Impl rule__Guidance__Group__1
            {
            pushFollow(FOLLOW_11);
            rule__Guidance__Group__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__Guidance__Group__1();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Guidance__Group__0"


    // $ANTLR start "rule__Guidance__Group__0__Impl"
    // InternalPDL2.g:908:1: rule__Guidance__Group__0__Impl : ( 'note' ) ;
    public final void rule__Guidance__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:912:1: ( ( 'note' ) )
            // InternalPDL2.g:913:1: ( 'note' )
            {
            // InternalPDL2.g:913:1: ( 'note' )
            // InternalPDL2.g:914:2: 'note'
            {
             before(grammarAccess.getGuidanceAccess().getNoteKeyword_0()); 
            match(input,18,FOLLOW_2); 
             after(grammarAccess.getGuidanceAccess().getNoteKeyword_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Guidance__Group__0__Impl"


    // $ANTLR start "rule__Guidance__Group__1"
    // InternalPDL2.g:923:1: rule__Guidance__Group__1 : rule__Guidance__Group__1__Impl ;
    public final void rule__Guidance__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:927:1: ( rule__Guidance__Group__1__Impl )
            // InternalPDL2.g:928:2: rule__Guidance__Group__1__Impl
            {
            pushFollow(FOLLOW_2);
            rule__Guidance__Group__1__Impl();

            state._fsp--;


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Guidance__Group__1"


    // $ANTLR start "rule__Guidance__Group__1__Impl"
    // InternalPDL2.g:934:1: rule__Guidance__Group__1__Impl : ( ( rule__Guidance__TexteAssignment_1 ) ) ;
    public final void rule__Guidance__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:938:1: ( ( ( rule__Guidance__TexteAssignment_1 ) ) )
            // InternalPDL2.g:939:1: ( ( rule__Guidance__TexteAssignment_1 ) )
            {
            // InternalPDL2.g:939:1: ( ( rule__Guidance__TexteAssignment_1 ) )
            // InternalPDL2.g:940:2: ( rule__Guidance__TexteAssignment_1 )
            {
             before(grammarAccess.getGuidanceAccess().getTexteAssignment_1()); 
            // InternalPDL2.g:941:2: ( rule__Guidance__TexteAssignment_1 )
            // InternalPDL2.g:941:3: rule__Guidance__TexteAssignment_1
            {
            pushFollow(FOLLOW_2);
            rule__Guidance__TexteAssignment_1();

            state._fsp--;


            }

             after(grammarAccess.getGuidanceAccess().getTexteAssignment_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Guidance__Group__1__Impl"


    // $ANTLR start "rule__Process__NameAssignment_1"
    // InternalPDL2.g:950:1: rule__Process__NameAssignment_1 : ( RULE_ID ) ;
    public final void rule__Process__NameAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:954:1: ( ( RULE_ID ) )
            // InternalPDL2.g:955:2: ( RULE_ID )
            {
            // InternalPDL2.g:955:2: ( RULE_ID )
            // InternalPDL2.g:956:3: RULE_ID
            {
             before(grammarAccess.getProcessAccess().getNameIDTerminalRuleCall_1_0()); 
            match(input,RULE_ID,FOLLOW_2); 
             after(grammarAccess.getProcessAccess().getNameIDTerminalRuleCall_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__NameAssignment_1"


    // $ANTLR start "rule__Process__ProcessElementsAssignment_3"
    // InternalPDL2.g:965:1: rule__Process__ProcessElementsAssignment_3 : ( ruleProcessElement ) ;
    public final void rule__Process__ProcessElementsAssignment_3() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:969:1: ( ( ruleProcessElement ) )
            // InternalPDL2.g:970:2: ( ruleProcessElement )
            {
            // InternalPDL2.g:970:2: ( ruleProcessElement )
            // InternalPDL2.g:971:3: ruleProcessElement
            {
             before(grammarAccess.getProcessAccess().getProcessElementsProcessElementParserRuleCall_3_0()); 
            pushFollow(FOLLOW_2);
            ruleProcessElement();

            state._fsp--;

             after(grammarAccess.getProcessAccess().getProcessElementsProcessElementParserRuleCall_3_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__ProcessElementsAssignment_3"


    // $ANTLR start "rule__WorkDefinition__NameAssignment_1"
    // InternalPDL2.g:980:1: rule__WorkDefinition__NameAssignment_1 : ( RULE_ID ) ;
    public final void rule__WorkDefinition__NameAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:984:1: ( ( RULE_ID ) )
            // InternalPDL2.g:985:2: ( RULE_ID )
            {
            // InternalPDL2.g:985:2: ( RULE_ID )
            // InternalPDL2.g:986:3: RULE_ID
            {
             before(grammarAccess.getWorkDefinitionAccess().getNameIDTerminalRuleCall_1_0()); 
            match(input,RULE_ID,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getNameIDTerminalRuleCall_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__NameAssignment_1"


    // $ANTLR start "rule__WorkDefinition__LinksToPredecessorsAssignment_3_2"
    // InternalPDL2.g:995:1: rule__WorkDefinition__LinksToPredecessorsAssignment_3_2 : ( ruleDependanceStart ) ;
    public final void rule__WorkDefinition__LinksToPredecessorsAssignment_3_2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:999:1: ( ( ruleDependanceStart ) )
            // InternalPDL2.g:1000:2: ( ruleDependanceStart )
            {
            // InternalPDL2.g:1000:2: ( ruleDependanceStart )
            // InternalPDL2.g:1001:3: ruleDependanceStart
            {
             before(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsDependanceStartParserRuleCall_3_2_0()); 
            pushFollow(FOLLOW_2);
            ruleDependanceStart();

            state._fsp--;

             after(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsDependanceStartParserRuleCall_3_2_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__LinksToPredecessorsAssignment_3_2"


    // $ANTLR start "rule__WorkDefinition__LinksToPredecessorsAssignment_4_2"
    // InternalPDL2.g:1010:1: rule__WorkDefinition__LinksToPredecessorsAssignment_4_2 : ( ruleDependanceFinish ) ;
    public final void rule__WorkDefinition__LinksToPredecessorsAssignment_4_2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:1014:1: ( ( ruleDependanceFinish ) )
            // InternalPDL2.g:1015:2: ( ruleDependanceFinish )
            {
            // InternalPDL2.g:1015:2: ( ruleDependanceFinish )
            // InternalPDL2.g:1016:3: ruleDependanceFinish
            {
             before(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsDependanceFinishParserRuleCall_4_2_0()); 
            pushFollow(FOLLOW_2);
            ruleDependanceFinish();

            state._fsp--;

             after(grammarAccess.getWorkDefinitionAccess().getLinksToPredecessorsDependanceFinishParserRuleCall_4_2_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__LinksToPredecessorsAssignment_4_2"


    // $ANTLR start "rule__DependanceStart__PredecessorAssignment_0"
    // InternalPDL2.g:1025:1: rule__DependanceStart__PredecessorAssignment_0 : ( ( RULE_ID ) ) ;
    public final void rule__DependanceStart__PredecessorAssignment_0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:1029:1: ( ( ( RULE_ID ) ) )
            // InternalPDL2.g:1030:2: ( ( RULE_ID ) )
            {
            // InternalPDL2.g:1030:2: ( ( RULE_ID ) )
            // InternalPDL2.g:1031:3: ( RULE_ID )
            {
             before(grammarAccess.getDependanceStartAccess().getPredecessorWorkDefinitionCrossReference_0_0()); 
            // InternalPDL2.g:1032:3: ( RULE_ID )
            // InternalPDL2.g:1033:4: RULE_ID
            {
             before(grammarAccess.getDependanceStartAccess().getPredecessorWorkDefinitionIDTerminalRuleCall_0_0_1()); 
            match(input,RULE_ID,FOLLOW_2); 
             after(grammarAccess.getDependanceStartAccess().getPredecessorWorkDefinitionIDTerminalRuleCall_0_0_1()); 

            }

             after(grammarAccess.getDependanceStartAccess().getPredecessorWorkDefinitionCrossReference_0_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceStart__PredecessorAssignment_0"


    // $ANTLR start "rule__DependanceStart__LinkAssignment_1"
    // InternalPDL2.g:1044:1: rule__DependanceStart__LinkAssignment_1 : ( ruleWorkSequenceKindStart ) ;
    public final void rule__DependanceStart__LinkAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:1048:1: ( ( ruleWorkSequenceKindStart ) )
            // InternalPDL2.g:1049:2: ( ruleWorkSequenceKindStart )
            {
            // InternalPDL2.g:1049:2: ( ruleWorkSequenceKindStart )
            // InternalPDL2.g:1050:3: ruleWorkSequenceKindStart
            {
             before(grammarAccess.getDependanceStartAccess().getLinkWorkSequenceKindStartParserRuleCall_1_0()); 
            pushFollow(FOLLOW_2);
            ruleWorkSequenceKindStart();

            state._fsp--;

             after(grammarAccess.getDependanceStartAccess().getLinkWorkSequenceKindStartParserRuleCall_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceStart__LinkAssignment_1"


    // $ANTLR start "rule__WorkSequenceKindStart__Started2StartAssignment_0"
    // InternalPDL2.g:1059:1: rule__WorkSequenceKindStart__Started2StartAssignment_0 : ( ( 'started' ) ) ;
    public final void rule__WorkSequenceKindStart__Started2StartAssignment_0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:1063:1: ( ( ( 'started' ) ) )
            // InternalPDL2.g:1064:2: ( ( 'started' ) )
            {
            // InternalPDL2.g:1064:2: ( ( 'started' ) )
            // InternalPDL2.g:1065:3: ( 'started' )
            {
             before(grammarAccess.getWorkSequenceKindStartAccess().getStarted2StartStartedKeyword_0_0()); 
            // InternalPDL2.g:1066:3: ( 'started' )
            // InternalPDL2.g:1067:4: 'started'
            {
             before(grammarAccess.getWorkSequenceKindStartAccess().getStarted2StartStartedKeyword_0_0()); 
            match(input,19,FOLLOW_2); 
             after(grammarAccess.getWorkSequenceKindStartAccess().getStarted2StartStartedKeyword_0_0()); 

            }

             after(grammarAccess.getWorkSequenceKindStartAccess().getStarted2StartStartedKeyword_0_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkSequenceKindStart__Started2StartAssignment_0"


    // $ANTLR start "rule__WorkSequenceKindStart__Started2FinishAssignment_1"
    // InternalPDL2.g:1078:1: rule__WorkSequenceKindStart__Started2FinishAssignment_1 : ( ( 'finished' ) ) ;
    public final void rule__WorkSequenceKindStart__Started2FinishAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:1082:1: ( ( ( 'finished' ) ) )
            // InternalPDL2.g:1083:2: ( ( 'finished' ) )
            {
            // InternalPDL2.g:1083:2: ( ( 'finished' ) )
            // InternalPDL2.g:1084:3: ( 'finished' )
            {
             before(grammarAccess.getWorkSequenceKindStartAccess().getStarted2FinishFinishedKeyword_1_0()); 
            // InternalPDL2.g:1085:3: ( 'finished' )
            // InternalPDL2.g:1086:4: 'finished'
            {
             before(grammarAccess.getWorkSequenceKindStartAccess().getStarted2FinishFinishedKeyword_1_0()); 
            match(input,20,FOLLOW_2); 
             after(grammarAccess.getWorkSequenceKindStartAccess().getStarted2FinishFinishedKeyword_1_0()); 

            }

             after(grammarAccess.getWorkSequenceKindStartAccess().getStarted2FinishFinishedKeyword_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkSequenceKindStart__Started2FinishAssignment_1"


    // $ANTLR start "rule__DependanceFinish__PredecessorAssignment_0"
    // InternalPDL2.g:1097:1: rule__DependanceFinish__PredecessorAssignment_0 : ( ( RULE_ID ) ) ;
    public final void rule__DependanceFinish__PredecessorAssignment_0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:1101:1: ( ( ( RULE_ID ) ) )
            // InternalPDL2.g:1102:2: ( ( RULE_ID ) )
            {
            // InternalPDL2.g:1102:2: ( ( RULE_ID ) )
            // InternalPDL2.g:1103:3: ( RULE_ID )
            {
             before(grammarAccess.getDependanceFinishAccess().getPredecessorWorkDefinitionCrossReference_0_0()); 
            // InternalPDL2.g:1104:3: ( RULE_ID )
            // InternalPDL2.g:1105:4: RULE_ID
            {
             before(grammarAccess.getDependanceFinishAccess().getPredecessorWorkDefinitionIDTerminalRuleCall_0_0_1()); 
            match(input,RULE_ID,FOLLOW_2); 
             after(grammarAccess.getDependanceFinishAccess().getPredecessorWorkDefinitionIDTerminalRuleCall_0_0_1()); 

            }

             after(grammarAccess.getDependanceFinishAccess().getPredecessorWorkDefinitionCrossReference_0_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceFinish__PredecessorAssignment_0"


    // $ANTLR start "rule__DependanceFinish__LinkAssignment_1"
    // InternalPDL2.g:1116:1: rule__DependanceFinish__LinkAssignment_1 : ( ruleWorkSequenceKindFinish ) ;
    public final void rule__DependanceFinish__LinkAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:1120:1: ( ( ruleWorkSequenceKindFinish ) )
            // InternalPDL2.g:1121:2: ( ruleWorkSequenceKindFinish )
            {
            // InternalPDL2.g:1121:2: ( ruleWorkSequenceKindFinish )
            // InternalPDL2.g:1122:3: ruleWorkSequenceKindFinish
            {
             before(grammarAccess.getDependanceFinishAccess().getLinkWorkSequenceKindFinishParserRuleCall_1_0()); 
            pushFollow(FOLLOW_2);
            ruleWorkSequenceKindFinish();

            state._fsp--;

             after(grammarAccess.getDependanceFinishAccess().getLinkWorkSequenceKindFinishParserRuleCall_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__DependanceFinish__LinkAssignment_1"


    // $ANTLR start "rule__WorkSequenceKindFinish__Finished2StartAssignment_0"
    // InternalPDL2.g:1131:1: rule__WorkSequenceKindFinish__Finished2StartAssignment_0 : ( ( 'started' ) ) ;
    public final void rule__WorkSequenceKindFinish__Finished2StartAssignment_0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:1135:1: ( ( ( 'started' ) ) )
            // InternalPDL2.g:1136:2: ( ( 'started' ) )
            {
            // InternalPDL2.g:1136:2: ( ( 'started' ) )
            // InternalPDL2.g:1137:3: ( 'started' )
            {
             before(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2StartStartedKeyword_0_0()); 
            // InternalPDL2.g:1138:3: ( 'started' )
            // InternalPDL2.g:1139:4: 'started'
            {
             before(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2StartStartedKeyword_0_0()); 
            match(input,19,FOLLOW_2); 
             after(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2StartStartedKeyword_0_0()); 

            }

             after(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2StartStartedKeyword_0_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkSequenceKindFinish__Finished2StartAssignment_0"


    // $ANTLR start "rule__WorkSequenceKindFinish__Finished2FinishAssignment_1"
    // InternalPDL2.g:1150:1: rule__WorkSequenceKindFinish__Finished2FinishAssignment_1 : ( ( 'finished' ) ) ;
    public final void rule__WorkSequenceKindFinish__Finished2FinishAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:1154:1: ( ( ( 'finished' ) ) )
            // InternalPDL2.g:1155:2: ( ( 'finished' ) )
            {
            // InternalPDL2.g:1155:2: ( ( 'finished' ) )
            // InternalPDL2.g:1156:3: ( 'finished' )
            {
             before(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2FinishFinishedKeyword_1_0()); 
            // InternalPDL2.g:1157:3: ( 'finished' )
            // InternalPDL2.g:1158:4: 'finished'
            {
             before(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2FinishFinishedKeyword_1_0()); 
            match(input,20,FOLLOW_2); 
             after(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2FinishFinishedKeyword_1_0()); 

            }

             after(grammarAccess.getWorkSequenceKindFinishAccess().getFinished2FinishFinishedKeyword_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkSequenceKindFinish__Finished2FinishAssignment_1"


    // $ANTLR start "rule__Guidance__TexteAssignment_1"
    // InternalPDL2.g:1169:1: rule__Guidance__TexteAssignment_1 : ( RULE_STRING ) ;
    public final void rule__Guidance__TexteAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL2.g:1173:1: ( ( RULE_STRING ) )
            // InternalPDL2.g:1174:2: ( RULE_STRING )
            {
            // InternalPDL2.g:1174:2: ( RULE_STRING )
            // InternalPDL2.g:1175:3: RULE_STRING
            {
             before(grammarAccess.getGuidanceAccess().getTexteSTRINGTerminalRuleCall_1_0()); 
            match(input,RULE_STRING,FOLLOW_2); 
             after(grammarAccess.getGuidanceAccess().getTexteSTRINGTerminalRuleCall_1_0()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Guidance__TexteAssignment_1"

    // Delegated rules


 

    public static final BitSet FOLLOW_1 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_2 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_3 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_4 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_5 = new BitSet(new long[]{0x0000000000046000L});
    public static final BitSet FOLLOW_6 = new BitSet(new long[]{0x0000000000044002L});
    public static final BitSet FOLLOW_7 = new BitSet(new long[]{0x000000000002A000L});
    public static final BitSet FOLLOW_8 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_9 = new BitSet(new long[]{0x0000000000000012L});
    public static final BitSet FOLLOW_10 = new BitSet(new long[]{0x0000000000180000L});
    public static final BitSet FOLLOW_11 = new BitSet(new long[]{0x0000000000000020L});

}