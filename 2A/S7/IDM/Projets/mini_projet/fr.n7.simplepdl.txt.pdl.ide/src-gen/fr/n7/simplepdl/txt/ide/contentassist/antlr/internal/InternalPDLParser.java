package fr.n7.simplepdl.txt.ide.contentassist.antlr.internal;

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
import fr.n7.simplepdl.txt.services.PDLGrammarAccess;



import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class InternalPDLParser extends AbstractInternalContentAssistParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "RULE_STRING", "RULE_ID", "RULE_INT", "RULE_ML_COMMENT", "RULE_SL_COMMENT", "RULE_WS", "RULE_ANY_OTHER", "'s2s'", "'f2s'", "'s2f'", "'f2f'", "'Process'", "'{'", "'}'", "'ProcessElement'", "'wd'", "'ws'", "'from'", "'to'", "'note'", "'rs'", "'-'"
    };
    public static final int RULE_STRING=4;
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
    public static final int RULE_ID=5;
    public static final int RULE_WS=9;
    public static final int RULE_ANY_OTHER=10;
    public static final int RULE_INT=6;
    public static final int T__22=22;
    public static final int RULE_ML_COMMENT=7;
    public static final int T__23=23;
    public static final int T__24=24;
    public static final int T__25=25;
    public static final int T__20=20;
    public static final int T__21=21;

    // delegates
    // delegators


        public InternalPDLParser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public InternalPDLParser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        

    public String[] getTokenNames() { return InternalPDLParser.tokenNames; }
    public String getGrammarFileName() { return "InternalPDL.g"; }


    	private PDLGrammarAccess grammarAccess;

    	public void setGrammarAccess(PDLGrammarAccess grammarAccess) {
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
    // InternalPDL.g:53:1: entryRuleProcess : ruleProcess EOF ;
    public final void entryRuleProcess() throws RecognitionException {
        try {
            // InternalPDL.g:54:1: ( ruleProcess EOF )
            // InternalPDL.g:55:1: ruleProcess EOF
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
    // InternalPDL.g:62:1: ruleProcess : ( ( rule__Process__Group__0 ) ) ;
    public final void ruleProcess() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:66:2: ( ( ( rule__Process__Group__0 ) ) )
            // InternalPDL.g:67:2: ( ( rule__Process__Group__0 ) )
            {
            // InternalPDL.g:67:2: ( ( rule__Process__Group__0 ) )
            // InternalPDL.g:68:3: ( rule__Process__Group__0 )
            {
             before(grammarAccess.getProcessAccess().getGroup()); 
            // InternalPDL.g:69:3: ( rule__Process__Group__0 )
            // InternalPDL.g:69:4: rule__Process__Group__0
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
    // InternalPDL.g:78:1: entryRuleProcessElement : ruleProcessElement EOF ;
    public final void entryRuleProcessElement() throws RecognitionException {
        try {
            // InternalPDL.g:79:1: ( ruleProcessElement EOF )
            // InternalPDL.g:80:1: ruleProcessElement EOF
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
    // InternalPDL.g:87:1: ruleProcessElement : ( ( rule__ProcessElement__Alternatives ) ) ;
    public final void ruleProcessElement() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:91:2: ( ( ( rule__ProcessElement__Alternatives ) ) )
            // InternalPDL.g:92:2: ( ( rule__ProcessElement__Alternatives ) )
            {
            // InternalPDL.g:92:2: ( ( rule__ProcessElement__Alternatives ) )
            // InternalPDL.g:93:3: ( rule__ProcessElement__Alternatives )
            {
             before(grammarAccess.getProcessElementAccess().getAlternatives()); 
            // InternalPDL.g:94:3: ( rule__ProcessElement__Alternatives )
            // InternalPDL.g:94:4: rule__ProcessElement__Alternatives
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


    // $ANTLR start "entryRuleEString"
    // InternalPDL.g:103:1: entryRuleEString : ruleEString EOF ;
    public final void entryRuleEString() throws RecognitionException {
        try {
            // InternalPDL.g:104:1: ( ruleEString EOF )
            // InternalPDL.g:105:1: ruleEString EOF
            {
             before(grammarAccess.getEStringRule()); 
            pushFollow(FOLLOW_1);
            ruleEString();

            state._fsp--;

             after(grammarAccess.getEStringRule()); 
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
    // $ANTLR end "entryRuleEString"


    // $ANTLR start "ruleEString"
    // InternalPDL.g:112:1: ruleEString : ( ( rule__EString__Alternatives ) ) ;
    public final void ruleEString() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:116:2: ( ( ( rule__EString__Alternatives ) ) )
            // InternalPDL.g:117:2: ( ( rule__EString__Alternatives ) )
            {
            // InternalPDL.g:117:2: ( ( rule__EString__Alternatives ) )
            // InternalPDL.g:118:3: ( rule__EString__Alternatives )
            {
             before(grammarAccess.getEStringAccess().getAlternatives()); 
            // InternalPDL.g:119:3: ( rule__EString__Alternatives )
            // InternalPDL.g:119:4: rule__EString__Alternatives
            {
            pushFollow(FOLLOW_2);
            rule__EString__Alternatives();

            state._fsp--;


            }

             after(grammarAccess.getEStringAccess().getAlternatives()); 

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
    // $ANTLR end "ruleEString"


    // $ANTLR start "entryRuleProcessElement_Impl"
    // InternalPDL.g:128:1: entryRuleProcessElement_Impl : ruleProcessElement_Impl EOF ;
    public final void entryRuleProcessElement_Impl() throws RecognitionException {
        try {
            // InternalPDL.g:129:1: ( ruleProcessElement_Impl EOF )
            // InternalPDL.g:130:1: ruleProcessElement_Impl EOF
            {
             before(grammarAccess.getProcessElement_ImplRule()); 
            pushFollow(FOLLOW_1);
            ruleProcessElement_Impl();

            state._fsp--;

             after(grammarAccess.getProcessElement_ImplRule()); 
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
    // $ANTLR end "entryRuleProcessElement_Impl"


    // $ANTLR start "ruleProcessElement_Impl"
    // InternalPDL.g:137:1: ruleProcessElement_Impl : ( ( rule__ProcessElement_Impl__Group__0 ) ) ;
    public final void ruleProcessElement_Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:141:2: ( ( ( rule__ProcessElement_Impl__Group__0 ) ) )
            // InternalPDL.g:142:2: ( ( rule__ProcessElement_Impl__Group__0 ) )
            {
            // InternalPDL.g:142:2: ( ( rule__ProcessElement_Impl__Group__0 ) )
            // InternalPDL.g:143:3: ( rule__ProcessElement_Impl__Group__0 )
            {
             before(grammarAccess.getProcessElement_ImplAccess().getGroup()); 
            // InternalPDL.g:144:3: ( rule__ProcessElement_Impl__Group__0 )
            // InternalPDL.g:144:4: rule__ProcessElement_Impl__Group__0
            {
            pushFollow(FOLLOW_2);
            rule__ProcessElement_Impl__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getProcessElement_ImplAccess().getGroup()); 

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
    // $ANTLR end "ruleProcessElement_Impl"


    // $ANTLR start "entryRuleWorkDefinition"
    // InternalPDL.g:153:1: entryRuleWorkDefinition : ruleWorkDefinition EOF ;
    public final void entryRuleWorkDefinition() throws RecognitionException {
        try {
            // InternalPDL.g:154:1: ( ruleWorkDefinition EOF )
            // InternalPDL.g:155:1: ruleWorkDefinition EOF
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
    // InternalPDL.g:162:1: ruleWorkDefinition : ( ( rule__WorkDefinition__Group__0 ) ) ;
    public final void ruleWorkDefinition() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:166:2: ( ( ( rule__WorkDefinition__Group__0 ) ) )
            // InternalPDL.g:167:2: ( ( rule__WorkDefinition__Group__0 ) )
            {
            // InternalPDL.g:167:2: ( ( rule__WorkDefinition__Group__0 ) )
            // InternalPDL.g:168:3: ( rule__WorkDefinition__Group__0 )
            {
             before(grammarAccess.getWorkDefinitionAccess().getGroup()); 
            // InternalPDL.g:169:3: ( rule__WorkDefinition__Group__0 )
            // InternalPDL.g:169:4: rule__WorkDefinition__Group__0
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


    // $ANTLR start "entryRuleWorkSequence"
    // InternalPDL.g:178:1: entryRuleWorkSequence : ruleWorkSequence EOF ;
    public final void entryRuleWorkSequence() throws RecognitionException {
        try {
            // InternalPDL.g:179:1: ( ruleWorkSequence EOF )
            // InternalPDL.g:180:1: ruleWorkSequence EOF
            {
             before(grammarAccess.getWorkSequenceRule()); 
            pushFollow(FOLLOW_1);
            ruleWorkSequence();

            state._fsp--;

             after(grammarAccess.getWorkSequenceRule()); 
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
    // $ANTLR end "entryRuleWorkSequence"


    // $ANTLR start "ruleWorkSequence"
    // InternalPDL.g:187:1: ruleWorkSequence : ( ( rule__WorkSequence__Group__0 ) ) ;
    public final void ruleWorkSequence() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:191:2: ( ( ( rule__WorkSequence__Group__0 ) ) )
            // InternalPDL.g:192:2: ( ( rule__WorkSequence__Group__0 ) )
            {
            // InternalPDL.g:192:2: ( ( rule__WorkSequence__Group__0 ) )
            // InternalPDL.g:193:3: ( rule__WorkSequence__Group__0 )
            {
             before(grammarAccess.getWorkSequenceAccess().getGroup()); 
            // InternalPDL.g:194:3: ( rule__WorkSequence__Group__0 )
            // InternalPDL.g:194:4: rule__WorkSequence__Group__0
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequence__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getWorkSequenceAccess().getGroup()); 

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
    // $ANTLR end "ruleWorkSequence"


    // $ANTLR start "entryRuleGuidance"
    // InternalPDL.g:203:1: entryRuleGuidance : ruleGuidance EOF ;
    public final void entryRuleGuidance() throws RecognitionException {
        try {
            // InternalPDL.g:204:1: ( ruleGuidance EOF )
            // InternalPDL.g:205:1: ruleGuidance EOF
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
    // InternalPDL.g:212:1: ruleGuidance : ( ( rule__Guidance__Group__0 ) ) ;
    public final void ruleGuidance() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:216:2: ( ( ( rule__Guidance__Group__0 ) ) )
            // InternalPDL.g:217:2: ( ( rule__Guidance__Group__0 ) )
            {
            // InternalPDL.g:217:2: ( ( rule__Guidance__Group__0 ) )
            // InternalPDL.g:218:3: ( rule__Guidance__Group__0 )
            {
             before(grammarAccess.getGuidanceAccess().getGroup()); 
            // InternalPDL.g:219:3: ( rule__Guidance__Group__0 )
            // InternalPDL.g:219:4: rule__Guidance__Group__0
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


    // $ANTLR start "entryRuleRessource"
    // InternalPDL.g:228:1: entryRuleRessource : ruleRessource EOF ;
    public final void entryRuleRessource() throws RecognitionException {
        try {
            // InternalPDL.g:229:1: ( ruleRessource EOF )
            // InternalPDL.g:230:1: ruleRessource EOF
            {
             before(grammarAccess.getRessourceRule()); 
            pushFollow(FOLLOW_1);
            ruleRessource();

            state._fsp--;

             after(grammarAccess.getRessourceRule()); 
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
    // $ANTLR end "entryRuleRessource"


    // $ANTLR start "ruleRessource"
    // InternalPDL.g:237:1: ruleRessource : ( ( rule__Ressource__Group__0 ) ) ;
    public final void ruleRessource() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:241:2: ( ( ( rule__Ressource__Group__0 ) ) )
            // InternalPDL.g:242:2: ( ( rule__Ressource__Group__0 ) )
            {
            // InternalPDL.g:242:2: ( ( rule__Ressource__Group__0 ) )
            // InternalPDL.g:243:3: ( rule__Ressource__Group__0 )
            {
             before(grammarAccess.getRessourceAccess().getGroup()); 
            // InternalPDL.g:244:3: ( rule__Ressource__Group__0 )
            // InternalPDL.g:244:4: rule__Ressource__Group__0
            {
            pushFollow(FOLLOW_2);
            rule__Ressource__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getRessourceAccess().getGroup()); 

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
    // $ANTLR end "ruleRessource"


    // $ANTLR start "entryRuleEInt"
    // InternalPDL.g:253:1: entryRuleEInt : ruleEInt EOF ;
    public final void entryRuleEInt() throws RecognitionException {
        try {
            // InternalPDL.g:254:1: ( ruleEInt EOF )
            // InternalPDL.g:255:1: ruleEInt EOF
            {
             before(grammarAccess.getEIntRule()); 
            pushFollow(FOLLOW_1);
            ruleEInt();

            state._fsp--;

             after(grammarAccess.getEIntRule()); 
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
    // $ANTLR end "entryRuleEInt"


    // $ANTLR start "ruleEInt"
    // InternalPDL.g:262:1: ruleEInt : ( ( rule__EInt__Group__0 ) ) ;
    public final void ruleEInt() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:266:2: ( ( ( rule__EInt__Group__0 ) ) )
            // InternalPDL.g:267:2: ( ( rule__EInt__Group__0 ) )
            {
            // InternalPDL.g:267:2: ( ( rule__EInt__Group__0 ) )
            // InternalPDL.g:268:3: ( rule__EInt__Group__0 )
            {
             before(grammarAccess.getEIntAccess().getGroup()); 
            // InternalPDL.g:269:3: ( rule__EInt__Group__0 )
            // InternalPDL.g:269:4: rule__EInt__Group__0
            {
            pushFollow(FOLLOW_2);
            rule__EInt__Group__0();

            state._fsp--;


            }

             after(grammarAccess.getEIntAccess().getGroup()); 

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
    // $ANTLR end "ruleEInt"


    // $ANTLR start "ruleWorkSequenceType"
    // InternalPDL.g:278:1: ruleWorkSequenceType : ( ( rule__WorkSequenceType__Alternatives ) ) ;
    public final void ruleWorkSequenceType() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:282:1: ( ( ( rule__WorkSequenceType__Alternatives ) ) )
            // InternalPDL.g:283:2: ( ( rule__WorkSequenceType__Alternatives ) )
            {
            // InternalPDL.g:283:2: ( ( rule__WorkSequenceType__Alternatives ) )
            // InternalPDL.g:284:3: ( rule__WorkSequenceType__Alternatives )
            {
             before(grammarAccess.getWorkSequenceTypeAccess().getAlternatives()); 
            // InternalPDL.g:285:3: ( rule__WorkSequenceType__Alternatives )
            // InternalPDL.g:285:4: rule__WorkSequenceType__Alternatives
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequenceType__Alternatives();

            state._fsp--;


            }

             after(grammarAccess.getWorkSequenceTypeAccess().getAlternatives()); 

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
    // $ANTLR end "ruleWorkSequenceType"


    // $ANTLR start "rule__ProcessElement__Alternatives"
    // InternalPDL.g:293:1: rule__ProcessElement__Alternatives : ( ( ruleProcessElement_Impl ) | ( ruleWorkDefinition ) | ( ruleWorkSequence ) | ( ruleGuidance ) | ( ruleRessource ) );
    public final void rule__ProcessElement__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:297:1: ( ( ruleProcessElement_Impl ) | ( ruleWorkDefinition ) | ( ruleWorkSequence ) | ( ruleGuidance ) | ( ruleRessource ) )
            int alt1=5;
            switch ( input.LA(1) ) {
            case 18:
                {
                alt1=1;
                }
                break;
            case 19:
                {
                alt1=2;
                }
                break;
            case 20:
                {
                alt1=3;
                }
                break;
            case 23:
                {
                alt1=4;
                }
                break;
            case 24:
                {
                alt1=5;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 1, 0, input);

                throw nvae;
            }

            switch (alt1) {
                case 1 :
                    // InternalPDL.g:298:2: ( ruleProcessElement_Impl )
                    {
                    // InternalPDL.g:298:2: ( ruleProcessElement_Impl )
                    // InternalPDL.g:299:3: ruleProcessElement_Impl
                    {
                     before(grammarAccess.getProcessElementAccess().getProcessElement_ImplParserRuleCall_0()); 
                    pushFollow(FOLLOW_2);
                    ruleProcessElement_Impl();

                    state._fsp--;

                     after(grammarAccess.getProcessElementAccess().getProcessElement_ImplParserRuleCall_0()); 

                    }


                    }
                    break;
                case 2 :
                    // InternalPDL.g:304:2: ( ruleWorkDefinition )
                    {
                    // InternalPDL.g:304:2: ( ruleWorkDefinition )
                    // InternalPDL.g:305:3: ruleWorkDefinition
                    {
                     before(grammarAccess.getProcessElementAccess().getWorkDefinitionParserRuleCall_1()); 
                    pushFollow(FOLLOW_2);
                    ruleWorkDefinition();

                    state._fsp--;

                     after(grammarAccess.getProcessElementAccess().getWorkDefinitionParserRuleCall_1()); 

                    }


                    }
                    break;
                case 3 :
                    // InternalPDL.g:310:2: ( ruleWorkSequence )
                    {
                    // InternalPDL.g:310:2: ( ruleWorkSequence )
                    // InternalPDL.g:311:3: ruleWorkSequence
                    {
                     before(grammarAccess.getProcessElementAccess().getWorkSequenceParserRuleCall_2()); 
                    pushFollow(FOLLOW_2);
                    ruleWorkSequence();

                    state._fsp--;

                     after(grammarAccess.getProcessElementAccess().getWorkSequenceParserRuleCall_2()); 

                    }


                    }
                    break;
                case 4 :
                    // InternalPDL.g:316:2: ( ruleGuidance )
                    {
                    // InternalPDL.g:316:2: ( ruleGuidance )
                    // InternalPDL.g:317:3: ruleGuidance
                    {
                     before(grammarAccess.getProcessElementAccess().getGuidanceParserRuleCall_3()); 
                    pushFollow(FOLLOW_2);
                    ruleGuidance();

                    state._fsp--;

                     after(grammarAccess.getProcessElementAccess().getGuidanceParserRuleCall_3()); 

                    }


                    }
                    break;
                case 5 :
                    // InternalPDL.g:322:2: ( ruleRessource )
                    {
                    // InternalPDL.g:322:2: ( ruleRessource )
                    // InternalPDL.g:323:3: ruleRessource
                    {
                     before(grammarAccess.getProcessElementAccess().getRessourceParserRuleCall_4()); 
                    pushFollow(FOLLOW_2);
                    ruleRessource();

                    state._fsp--;

                     after(grammarAccess.getProcessElementAccess().getRessourceParserRuleCall_4()); 

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


    // $ANTLR start "rule__EString__Alternatives"
    // InternalPDL.g:332:1: rule__EString__Alternatives : ( ( RULE_STRING ) | ( RULE_ID ) );
    public final void rule__EString__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:336:1: ( ( RULE_STRING ) | ( RULE_ID ) )
            int alt2=2;
            int LA2_0 = input.LA(1);

            if ( (LA2_0==RULE_STRING) ) {
                alt2=1;
            }
            else if ( (LA2_0==RULE_ID) ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // InternalPDL.g:337:2: ( RULE_STRING )
                    {
                    // InternalPDL.g:337:2: ( RULE_STRING )
                    // InternalPDL.g:338:3: RULE_STRING
                    {
                     before(grammarAccess.getEStringAccess().getSTRINGTerminalRuleCall_0()); 
                    match(input,RULE_STRING,FOLLOW_2); 
                     after(grammarAccess.getEStringAccess().getSTRINGTerminalRuleCall_0()); 

                    }


                    }
                    break;
                case 2 :
                    // InternalPDL.g:343:2: ( RULE_ID )
                    {
                    // InternalPDL.g:343:2: ( RULE_ID )
                    // InternalPDL.g:344:3: RULE_ID
                    {
                     before(grammarAccess.getEStringAccess().getIDTerminalRuleCall_1()); 
                    match(input,RULE_ID,FOLLOW_2); 
                     after(grammarAccess.getEStringAccess().getIDTerminalRuleCall_1()); 

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
    // $ANTLR end "rule__EString__Alternatives"


    // $ANTLR start "rule__WorkSequenceType__Alternatives"
    // InternalPDL.g:353:1: rule__WorkSequenceType__Alternatives : ( ( ( 's2s' ) ) | ( ( 'f2s' ) ) | ( ( 's2f' ) ) | ( ( 'f2f' ) ) );
    public final void rule__WorkSequenceType__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:357:1: ( ( ( 's2s' ) ) | ( ( 'f2s' ) ) | ( ( 's2f' ) ) | ( ( 'f2f' ) ) )
            int alt3=4;
            switch ( input.LA(1) ) {
            case 11:
                {
                alt3=1;
                }
                break;
            case 12:
                {
                alt3=2;
                }
                break;
            case 13:
                {
                alt3=3;
                }
                break;
            case 14:
                {
                alt3=4;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 3, 0, input);

                throw nvae;
            }

            switch (alt3) {
                case 1 :
                    // InternalPDL.g:358:2: ( ( 's2s' ) )
                    {
                    // InternalPDL.g:358:2: ( ( 's2s' ) )
                    // InternalPDL.g:359:3: ( 's2s' )
                    {
                     before(grammarAccess.getWorkSequenceTypeAccess().getStartToStartEnumLiteralDeclaration_0()); 
                    // InternalPDL.g:360:3: ( 's2s' )
                    // InternalPDL.g:360:4: 's2s'
                    {
                    match(input,11,FOLLOW_2); 

                    }

                     after(grammarAccess.getWorkSequenceTypeAccess().getStartToStartEnumLiteralDeclaration_0()); 

                    }


                    }
                    break;
                case 2 :
                    // InternalPDL.g:364:2: ( ( 'f2s' ) )
                    {
                    // InternalPDL.g:364:2: ( ( 'f2s' ) )
                    // InternalPDL.g:365:3: ( 'f2s' )
                    {
                     before(grammarAccess.getWorkSequenceTypeAccess().getFinishToStartEnumLiteralDeclaration_1()); 
                    // InternalPDL.g:366:3: ( 'f2s' )
                    // InternalPDL.g:366:4: 'f2s'
                    {
                    match(input,12,FOLLOW_2); 

                    }

                     after(grammarAccess.getWorkSequenceTypeAccess().getFinishToStartEnumLiteralDeclaration_1()); 

                    }


                    }
                    break;
                case 3 :
                    // InternalPDL.g:370:2: ( ( 's2f' ) )
                    {
                    // InternalPDL.g:370:2: ( ( 's2f' ) )
                    // InternalPDL.g:371:3: ( 's2f' )
                    {
                     before(grammarAccess.getWorkSequenceTypeAccess().getStartToFinishEnumLiteralDeclaration_2()); 
                    // InternalPDL.g:372:3: ( 's2f' )
                    // InternalPDL.g:372:4: 's2f'
                    {
                    match(input,13,FOLLOW_2); 

                    }

                     after(grammarAccess.getWorkSequenceTypeAccess().getStartToFinishEnumLiteralDeclaration_2()); 

                    }


                    }
                    break;
                case 4 :
                    // InternalPDL.g:376:2: ( ( 'f2f' ) )
                    {
                    // InternalPDL.g:376:2: ( ( 'f2f' ) )
                    // InternalPDL.g:377:3: ( 'f2f' )
                    {
                     before(grammarAccess.getWorkSequenceTypeAccess().getFinishToFinishEnumLiteralDeclaration_3()); 
                    // InternalPDL.g:378:3: ( 'f2f' )
                    // InternalPDL.g:378:4: 'f2f'
                    {
                    match(input,14,FOLLOW_2); 

                    }

                     after(grammarAccess.getWorkSequenceTypeAccess().getFinishToFinishEnumLiteralDeclaration_3()); 

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
    // $ANTLR end "rule__WorkSequenceType__Alternatives"


    // $ANTLR start "rule__Process__Group__0"
    // InternalPDL.g:386:1: rule__Process__Group__0 : rule__Process__Group__0__Impl rule__Process__Group__1 ;
    public final void rule__Process__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:390:1: ( rule__Process__Group__0__Impl rule__Process__Group__1 )
            // InternalPDL.g:391:2: rule__Process__Group__0__Impl rule__Process__Group__1
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
    // InternalPDL.g:398:1: rule__Process__Group__0__Impl : ( () ) ;
    public final void rule__Process__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:402:1: ( ( () ) )
            // InternalPDL.g:403:1: ( () )
            {
            // InternalPDL.g:403:1: ( () )
            // InternalPDL.g:404:2: ()
            {
             before(grammarAccess.getProcessAccess().getProcessAction_0()); 
            // InternalPDL.g:405:2: ()
            // InternalPDL.g:405:3: 
            {
            }

             after(grammarAccess.getProcessAccess().getProcessAction_0()); 

            }


            }

        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Process__Group__0__Impl"


    // $ANTLR start "rule__Process__Group__1"
    // InternalPDL.g:413:1: rule__Process__Group__1 : rule__Process__Group__1__Impl rule__Process__Group__2 ;
    public final void rule__Process__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:417:1: ( rule__Process__Group__1__Impl rule__Process__Group__2 )
            // InternalPDL.g:418:2: rule__Process__Group__1__Impl rule__Process__Group__2
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
    // InternalPDL.g:425:1: rule__Process__Group__1__Impl : ( 'Process' ) ;
    public final void rule__Process__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:429:1: ( ( 'Process' ) )
            // InternalPDL.g:430:1: ( 'Process' )
            {
            // InternalPDL.g:430:1: ( 'Process' )
            // InternalPDL.g:431:2: 'Process'
            {
             before(grammarAccess.getProcessAccess().getProcessKeyword_1()); 
            match(input,15,FOLLOW_2); 
             after(grammarAccess.getProcessAccess().getProcessKeyword_1()); 

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
    // InternalPDL.g:440:1: rule__Process__Group__2 : rule__Process__Group__2__Impl rule__Process__Group__3 ;
    public final void rule__Process__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:444:1: ( rule__Process__Group__2__Impl rule__Process__Group__3 )
            // InternalPDL.g:445:2: rule__Process__Group__2__Impl rule__Process__Group__3
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
    // InternalPDL.g:452:1: rule__Process__Group__2__Impl : ( ( rule__Process__NameAssignment_2 ) ) ;
    public final void rule__Process__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:456:1: ( ( ( rule__Process__NameAssignment_2 ) ) )
            // InternalPDL.g:457:1: ( ( rule__Process__NameAssignment_2 ) )
            {
            // InternalPDL.g:457:1: ( ( rule__Process__NameAssignment_2 ) )
            // InternalPDL.g:458:2: ( rule__Process__NameAssignment_2 )
            {
             before(grammarAccess.getProcessAccess().getNameAssignment_2()); 
            // InternalPDL.g:459:2: ( rule__Process__NameAssignment_2 )
            // InternalPDL.g:459:3: rule__Process__NameAssignment_2
            {
            pushFollow(FOLLOW_2);
            rule__Process__NameAssignment_2();

            state._fsp--;


            }

             after(grammarAccess.getProcessAccess().getNameAssignment_2()); 

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
    // InternalPDL.g:467:1: rule__Process__Group__3 : rule__Process__Group__3__Impl rule__Process__Group__4 ;
    public final void rule__Process__Group__3() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:471:1: ( rule__Process__Group__3__Impl rule__Process__Group__4 )
            // InternalPDL.g:472:2: rule__Process__Group__3__Impl rule__Process__Group__4
            {
            pushFollow(FOLLOW_6);
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
    // InternalPDL.g:479:1: rule__Process__Group__3__Impl : ( '{' ) ;
    public final void rule__Process__Group__3__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:483:1: ( ( '{' ) )
            // InternalPDL.g:484:1: ( '{' )
            {
            // InternalPDL.g:484:1: ( '{' )
            // InternalPDL.g:485:2: '{'
            {
             before(grammarAccess.getProcessAccess().getLeftCurlyBracketKeyword_3()); 
            match(input,16,FOLLOW_2); 
             after(grammarAccess.getProcessAccess().getLeftCurlyBracketKeyword_3()); 

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
    // InternalPDL.g:494:1: rule__Process__Group__4 : rule__Process__Group__4__Impl rule__Process__Group__5 ;
    public final void rule__Process__Group__4() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:498:1: ( rule__Process__Group__4__Impl rule__Process__Group__5 )
            // InternalPDL.g:499:2: rule__Process__Group__4__Impl rule__Process__Group__5
            {
            pushFollow(FOLLOW_6);
            rule__Process__Group__4__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__Process__Group__5();

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
    // InternalPDL.g:506:1: rule__Process__Group__4__Impl : ( ( rule__Process__ProcessElementsAssignment_4 )* ) ;
    public final void rule__Process__Group__4__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:510:1: ( ( ( rule__Process__ProcessElementsAssignment_4 )* ) )
            // InternalPDL.g:511:1: ( ( rule__Process__ProcessElementsAssignment_4 )* )
            {
            // InternalPDL.g:511:1: ( ( rule__Process__ProcessElementsAssignment_4 )* )
            // InternalPDL.g:512:2: ( rule__Process__ProcessElementsAssignment_4 )*
            {
             before(grammarAccess.getProcessAccess().getProcessElementsAssignment_4()); 
            // InternalPDL.g:513:2: ( rule__Process__ProcessElementsAssignment_4 )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);

                if ( ((LA4_0>=18 && LA4_0<=20)||(LA4_0>=23 && LA4_0<=24)) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // InternalPDL.g:513:3: rule__Process__ProcessElementsAssignment_4
            	    {
            	    pushFollow(FOLLOW_7);
            	    rule__Process__ProcessElementsAssignment_4();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop4;
                }
            } while (true);

             after(grammarAccess.getProcessAccess().getProcessElementsAssignment_4()); 

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


    // $ANTLR start "rule__Process__Group__5"
    // InternalPDL.g:521:1: rule__Process__Group__5 : rule__Process__Group__5__Impl ;
    public final void rule__Process__Group__5() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:525:1: ( rule__Process__Group__5__Impl )
            // InternalPDL.g:526:2: rule__Process__Group__5__Impl
            {
            pushFollow(FOLLOW_2);
            rule__Process__Group__5__Impl();

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
    // $ANTLR end "rule__Process__Group__5"


    // $ANTLR start "rule__Process__Group__5__Impl"
    // InternalPDL.g:532:1: rule__Process__Group__5__Impl : ( '}' ) ;
    public final void rule__Process__Group__5__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:536:1: ( ( '}' ) )
            // InternalPDL.g:537:1: ( '}' )
            {
            // InternalPDL.g:537:1: ( '}' )
            // InternalPDL.g:538:2: '}'
            {
             before(grammarAccess.getProcessAccess().getRightCurlyBracketKeyword_5()); 
            match(input,17,FOLLOW_2); 
             after(grammarAccess.getProcessAccess().getRightCurlyBracketKeyword_5()); 

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
    // $ANTLR end "rule__Process__Group__5__Impl"


    // $ANTLR start "rule__ProcessElement_Impl__Group__0"
    // InternalPDL.g:548:1: rule__ProcessElement_Impl__Group__0 : rule__ProcessElement_Impl__Group__0__Impl rule__ProcessElement_Impl__Group__1 ;
    public final void rule__ProcessElement_Impl__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:552:1: ( rule__ProcessElement_Impl__Group__0__Impl rule__ProcessElement_Impl__Group__1 )
            // InternalPDL.g:553:2: rule__ProcessElement_Impl__Group__0__Impl rule__ProcessElement_Impl__Group__1
            {
            pushFollow(FOLLOW_8);
            rule__ProcessElement_Impl__Group__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__ProcessElement_Impl__Group__1();

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
    // $ANTLR end "rule__ProcessElement_Impl__Group__0"


    // $ANTLR start "rule__ProcessElement_Impl__Group__0__Impl"
    // InternalPDL.g:560:1: rule__ProcessElement_Impl__Group__0__Impl : ( () ) ;
    public final void rule__ProcessElement_Impl__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:564:1: ( ( () ) )
            // InternalPDL.g:565:1: ( () )
            {
            // InternalPDL.g:565:1: ( () )
            // InternalPDL.g:566:2: ()
            {
             before(grammarAccess.getProcessElement_ImplAccess().getProcessElementsAction_0()); 
            // InternalPDL.g:567:2: ()
            // InternalPDL.g:567:3: 
            {
            }

             after(grammarAccess.getProcessElement_ImplAccess().getProcessElementsAction_0()); 

            }


            }

        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__ProcessElement_Impl__Group__0__Impl"


    // $ANTLR start "rule__ProcessElement_Impl__Group__1"
    // InternalPDL.g:575:1: rule__ProcessElement_Impl__Group__1 : rule__ProcessElement_Impl__Group__1__Impl ;
    public final void rule__ProcessElement_Impl__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:579:1: ( rule__ProcessElement_Impl__Group__1__Impl )
            // InternalPDL.g:580:2: rule__ProcessElement_Impl__Group__1__Impl
            {
            pushFollow(FOLLOW_2);
            rule__ProcessElement_Impl__Group__1__Impl();

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
    // $ANTLR end "rule__ProcessElement_Impl__Group__1"


    // $ANTLR start "rule__ProcessElement_Impl__Group__1__Impl"
    // InternalPDL.g:586:1: rule__ProcessElement_Impl__Group__1__Impl : ( 'ProcessElement' ) ;
    public final void rule__ProcessElement_Impl__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:590:1: ( ( 'ProcessElement' ) )
            // InternalPDL.g:591:1: ( 'ProcessElement' )
            {
            // InternalPDL.g:591:1: ( 'ProcessElement' )
            // InternalPDL.g:592:2: 'ProcessElement'
            {
             before(grammarAccess.getProcessElement_ImplAccess().getProcessElementKeyword_1()); 
            match(input,18,FOLLOW_2); 
             after(grammarAccess.getProcessElement_ImplAccess().getProcessElementKeyword_1()); 

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
    // $ANTLR end "rule__ProcessElement_Impl__Group__1__Impl"


    // $ANTLR start "rule__WorkDefinition__Group__0"
    // InternalPDL.g:602:1: rule__WorkDefinition__Group__0 : rule__WorkDefinition__Group__0__Impl rule__WorkDefinition__Group__1 ;
    public final void rule__WorkDefinition__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:606:1: ( rule__WorkDefinition__Group__0__Impl rule__WorkDefinition__Group__1 )
            // InternalPDL.g:607:2: rule__WorkDefinition__Group__0__Impl rule__WorkDefinition__Group__1
            {
            pushFollow(FOLLOW_9);
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
    // InternalPDL.g:614:1: rule__WorkDefinition__Group__0__Impl : ( () ) ;
    public final void rule__WorkDefinition__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:618:1: ( ( () ) )
            // InternalPDL.g:619:1: ( () )
            {
            // InternalPDL.g:619:1: ( () )
            // InternalPDL.g:620:2: ()
            {
             before(grammarAccess.getWorkDefinitionAccess().getWorkDefinitionAction_0()); 
            // InternalPDL.g:621:2: ()
            // InternalPDL.g:621:3: 
            {
            }

             after(grammarAccess.getWorkDefinitionAccess().getWorkDefinitionAction_0()); 

            }


            }

        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__WorkDefinition__Group__0__Impl"


    // $ANTLR start "rule__WorkDefinition__Group__1"
    // InternalPDL.g:629:1: rule__WorkDefinition__Group__1 : rule__WorkDefinition__Group__1__Impl rule__WorkDefinition__Group__2 ;
    public final void rule__WorkDefinition__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:633:1: ( rule__WorkDefinition__Group__1__Impl rule__WorkDefinition__Group__2 )
            // InternalPDL.g:634:2: rule__WorkDefinition__Group__1__Impl rule__WorkDefinition__Group__2
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
    // InternalPDL.g:641:1: rule__WorkDefinition__Group__1__Impl : ( 'wd' ) ;
    public final void rule__WorkDefinition__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:645:1: ( ( 'wd' ) )
            // InternalPDL.g:646:1: ( 'wd' )
            {
            // InternalPDL.g:646:1: ( 'wd' )
            // InternalPDL.g:647:2: 'wd'
            {
             before(grammarAccess.getWorkDefinitionAccess().getWdKeyword_1()); 
            match(input,19,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getWdKeyword_1()); 

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
    // InternalPDL.g:656:1: rule__WorkDefinition__Group__2 : rule__WorkDefinition__Group__2__Impl ;
    public final void rule__WorkDefinition__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:660:1: ( rule__WorkDefinition__Group__2__Impl )
            // InternalPDL.g:661:2: rule__WorkDefinition__Group__2__Impl
            {
            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group__2__Impl();

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
    // InternalPDL.g:667:1: rule__WorkDefinition__Group__2__Impl : ( ( rule__WorkDefinition__NameAssignment_2 ) ) ;
    public final void rule__WorkDefinition__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:671:1: ( ( ( rule__WorkDefinition__NameAssignment_2 ) ) )
            // InternalPDL.g:672:1: ( ( rule__WorkDefinition__NameAssignment_2 ) )
            {
            // InternalPDL.g:672:1: ( ( rule__WorkDefinition__NameAssignment_2 ) )
            // InternalPDL.g:673:2: ( rule__WorkDefinition__NameAssignment_2 )
            {
             before(grammarAccess.getWorkDefinitionAccess().getNameAssignment_2()); 
            // InternalPDL.g:674:2: ( rule__WorkDefinition__NameAssignment_2 )
            // InternalPDL.g:674:3: rule__WorkDefinition__NameAssignment_2
            {
            pushFollow(FOLLOW_2);
            rule__WorkDefinition__NameAssignment_2();

            state._fsp--;


            }

             after(grammarAccess.getWorkDefinitionAccess().getNameAssignment_2()); 

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


    // $ANTLR start "rule__WorkSequence__Group__0"
    // InternalPDL.g:683:1: rule__WorkSequence__Group__0 : rule__WorkSequence__Group__0__Impl rule__WorkSequence__Group__1 ;
    public final void rule__WorkSequence__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:687:1: ( rule__WorkSequence__Group__0__Impl rule__WorkSequence__Group__1 )
            // InternalPDL.g:688:2: rule__WorkSequence__Group__0__Impl rule__WorkSequence__Group__1
            {
            pushFollow(FOLLOW_10);
            rule__WorkSequence__Group__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkSequence__Group__1();

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
    // $ANTLR end "rule__WorkSequence__Group__0"


    // $ANTLR start "rule__WorkSequence__Group__0__Impl"
    // InternalPDL.g:695:1: rule__WorkSequence__Group__0__Impl : ( 'ws' ) ;
    public final void rule__WorkSequence__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:699:1: ( ( 'ws' ) )
            // InternalPDL.g:700:1: ( 'ws' )
            {
            // InternalPDL.g:700:1: ( 'ws' )
            // InternalPDL.g:701:2: 'ws'
            {
             before(grammarAccess.getWorkSequenceAccess().getWsKeyword_0()); 
            match(input,20,FOLLOW_2); 
             after(grammarAccess.getWorkSequenceAccess().getWsKeyword_0()); 

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
    // $ANTLR end "rule__WorkSequence__Group__0__Impl"


    // $ANTLR start "rule__WorkSequence__Group__1"
    // InternalPDL.g:710:1: rule__WorkSequence__Group__1 : rule__WorkSequence__Group__1__Impl rule__WorkSequence__Group__2 ;
    public final void rule__WorkSequence__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:714:1: ( rule__WorkSequence__Group__1__Impl rule__WorkSequence__Group__2 )
            // InternalPDL.g:715:2: rule__WorkSequence__Group__1__Impl rule__WorkSequence__Group__2
            {
            pushFollow(FOLLOW_11);
            rule__WorkSequence__Group__1__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkSequence__Group__2();

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
    // $ANTLR end "rule__WorkSequence__Group__1"


    // $ANTLR start "rule__WorkSequence__Group__1__Impl"
    // InternalPDL.g:722:1: rule__WorkSequence__Group__1__Impl : ( ( rule__WorkSequence__LinkTypeAssignment_1 ) ) ;
    public final void rule__WorkSequence__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:726:1: ( ( ( rule__WorkSequence__LinkTypeAssignment_1 ) ) )
            // InternalPDL.g:727:1: ( ( rule__WorkSequence__LinkTypeAssignment_1 ) )
            {
            // InternalPDL.g:727:1: ( ( rule__WorkSequence__LinkTypeAssignment_1 ) )
            // InternalPDL.g:728:2: ( rule__WorkSequence__LinkTypeAssignment_1 )
            {
             before(grammarAccess.getWorkSequenceAccess().getLinkTypeAssignment_1()); 
            // InternalPDL.g:729:2: ( rule__WorkSequence__LinkTypeAssignment_1 )
            // InternalPDL.g:729:3: rule__WorkSequence__LinkTypeAssignment_1
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequence__LinkTypeAssignment_1();

            state._fsp--;


            }

             after(grammarAccess.getWorkSequenceAccess().getLinkTypeAssignment_1()); 

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
    // $ANTLR end "rule__WorkSequence__Group__1__Impl"


    // $ANTLR start "rule__WorkSequence__Group__2"
    // InternalPDL.g:737:1: rule__WorkSequence__Group__2 : rule__WorkSequence__Group__2__Impl rule__WorkSequence__Group__3 ;
    public final void rule__WorkSequence__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:741:1: ( rule__WorkSequence__Group__2__Impl rule__WorkSequence__Group__3 )
            // InternalPDL.g:742:2: rule__WorkSequence__Group__2__Impl rule__WorkSequence__Group__3
            {
            pushFollow(FOLLOW_4);
            rule__WorkSequence__Group__2__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkSequence__Group__3();

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
    // $ANTLR end "rule__WorkSequence__Group__2"


    // $ANTLR start "rule__WorkSequence__Group__2__Impl"
    // InternalPDL.g:749:1: rule__WorkSequence__Group__2__Impl : ( 'from' ) ;
    public final void rule__WorkSequence__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:753:1: ( ( 'from' ) )
            // InternalPDL.g:754:1: ( 'from' )
            {
            // InternalPDL.g:754:1: ( 'from' )
            // InternalPDL.g:755:2: 'from'
            {
             before(grammarAccess.getWorkSequenceAccess().getFromKeyword_2()); 
            match(input,21,FOLLOW_2); 
             after(grammarAccess.getWorkSequenceAccess().getFromKeyword_2()); 

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
    // $ANTLR end "rule__WorkSequence__Group__2__Impl"


    // $ANTLR start "rule__WorkSequence__Group__3"
    // InternalPDL.g:764:1: rule__WorkSequence__Group__3 : rule__WorkSequence__Group__3__Impl rule__WorkSequence__Group__4 ;
    public final void rule__WorkSequence__Group__3() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:768:1: ( rule__WorkSequence__Group__3__Impl rule__WorkSequence__Group__4 )
            // InternalPDL.g:769:2: rule__WorkSequence__Group__3__Impl rule__WorkSequence__Group__4
            {
            pushFollow(FOLLOW_12);
            rule__WorkSequence__Group__3__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkSequence__Group__4();

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
    // $ANTLR end "rule__WorkSequence__Group__3"


    // $ANTLR start "rule__WorkSequence__Group__3__Impl"
    // InternalPDL.g:776:1: rule__WorkSequence__Group__3__Impl : ( ( rule__WorkSequence__PredecessorAssignment_3 ) ) ;
    public final void rule__WorkSequence__Group__3__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:780:1: ( ( ( rule__WorkSequence__PredecessorAssignment_3 ) ) )
            // InternalPDL.g:781:1: ( ( rule__WorkSequence__PredecessorAssignment_3 ) )
            {
            // InternalPDL.g:781:1: ( ( rule__WorkSequence__PredecessorAssignment_3 ) )
            // InternalPDL.g:782:2: ( rule__WorkSequence__PredecessorAssignment_3 )
            {
             before(grammarAccess.getWorkSequenceAccess().getPredecessorAssignment_3()); 
            // InternalPDL.g:783:2: ( rule__WorkSequence__PredecessorAssignment_3 )
            // InternalPDL.g:783:3: rule__WorkSequence__PredecessorAssignment_3
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequence__PredecessorAssignment_3();

            state._fsp--;


            }

             after(grammarAccess.getWorkSequenceAccess().getPredecessorAssignment_3()); 

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
    // $ANTLR end "rule__WorkSequence__Group__3__Impl"


    // $ANTLR start "rule__WorkSequence__Group__4"
    // InternalPDL.g:791:1: rule__WorkSequence__Group__4 : rule__WorkSequence__Group__4__Impl rule__WorkSequence__Group__5 ;
    public final void rule__WorkSequence__Group__4() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:795:1: ( rule__WorkSequence__Group__4__Impl rule__WorkSequence__Group__5 )
            // InternalPDL.g:796:2: rule__WorkSequence__Group__4__Impl rule__WorkSequence__Group__5
            {
            pushFollow(FOLLOW_4);
            rule__WorkSequence__Group__4__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__WorkSequence__Group__5();

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
    // $ANTLR end "rule__WorkSequence__Group__4"


    // $ANTLR start "rule__WorkSequence__Group__4__Impl"
    // InternalPDL.g:803:1: rule__WorkSequence__Group__4__Impl : ( 'to' ) ;
    public final void rule__WorkSequence__Group__4__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:807:1: ( ( 'to' ) )
            // InternalPDL.g:808:1: ( 'to' )
            {
            // InternalPDL.g:808:1: ( 'to' )
            // InternalPDL.g:809:2: 'to'
            {
             before(grammarAccess.getWorkSequenceAccess().getToKeyword_4()); 
            match(input,22,FOLLOW_2); 
             after(grammarAccess.getWorkSequenceAccess().getToKeyword_4()); 

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
    // $ANTLR end "rule__WorkSequence__Group__4__Impl"


    // $ANTLR start "rule__WorkSequence__Group__5"
    // InternalPDL.g:818:1: rule__WorkSequence__Group__5 : rule__WorkSequence__Group__5__Impl ;
    public final void rule__WorkSequence__Group__5() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:822:1: ( rule__WorkSequence__Group__5__Impl )
            // InternalPDL.g:823:2: rule__WorkSequence__Group__5__Impl
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequence__Group__5__Impl();

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
    // $ANTLR end "rule__WorkSequence__Group__5"


    // $ANTLR start "rule__WorkSequence__Group__5__Impl"
    // InternalPDL.g:829:1: rule__WorkSequence__Group__5__Impl : ( ( rule__WorkSequence__SuccessorAssignment_5 ) ) ;
    public final void rule__WorkSequence__Group__5__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:833:1: ( ( ( rule__WorkSequence__SuccessorAssignment_5 ) ) )
            // InternalPDL.g:834:1: ( ( rule__WorkSequence__SuccessorAssignment_5 ) )
            {
            // InternalPDL.g:834:1: ( ( rule__WorkSequence__SuccessorAssignment_5 ) )
            // InternalPDL.g:835:2: ( rule__WorkSequence__SuccessorAssignment_5 )
            {
             before(grammarAccess.getWorkSequenceAccess().getSuccessorAssignment_5()); 
            // InternalPDL.g:836:2: ( rule__WorkSequence__SuccessorAssignment_5 )
            // InternalPDL.g:836:3: rule__WorkSequence__SuccessorAssignment_5
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequence__SuccessorAssignment_5();

            state._fsp--;


            }

             after(grammarAccess.getWorkSequenceAccess().getSuccessorAssignment_5()); 

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
    // $ANTLR end "rule__WorkSequence__Group__5__Impl"


    // $ANTLR start "rule__Guidance__Group__0"
    // InternalPDL.g:845:1: rule__Guidance__Group__0 : rule__Guidance__Group__0__Impl rule__Guidance__Group__1 ;
    public final void rule__Guidance__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:849:1: ( rule__Guidance__Group__0__Impl rule__Guidance__Group__1 )
            // InternalPDL.g:850:2: rule__Guidance__Group__0__Impl rule__Guidance__Group__1
            {
            pushFollow(FOLLOW_4);
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
    // InternalPDL.g:857:1: rule__Guidance__Group__0__Impl : ( 'note' ) ;
    public final void rule__Guidance__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:861:1: ( ( 'note' ) )
            // InternalPDL.g:862:1: ( 'note' )
            {
            // InternalPDL.g:862:1: ( 'note' )
            // InternalPDL.g:863:2: 'note'
            {
             before(grammarAccess.getGuidanceAccess().getNoteKeyword_0()); 
            match(input,23,FOLLOW_2); 
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
    // InternalPDL.g:872:1: rule__Guidance__Group__1 : rule__Guidance__Group__1__Impl ;
    public final void rule__Guidance__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:876:1: ( rule__Guidance__Group__1__Impl )
            // InternalPDL.g:877:2: rule__Guidance__Group__1__Impl
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
    // InternalPDL.g:883:1: rule__Guidance__Group__1__Impl : ( ( rule__Guidance__TextAssignment_1 ) ) ;
    public final void rule__Guidance__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:887:1: ( ( ( rule__Guidance__TextAssignment_1 ) ) )
            // InternalPDL.g:888:1: ( ( rule__Guidance__TextAssignment_1 ) )
            {
            // InternalPDL.g:888:1: ( ( rule__Guidance__TextAssignment_1 ) )
            // InternalPDL.g:889:2: ( rule__Guidance__TextAssignment_1 )
            {
             before(grammarAccess.getGuidanceAccess().getTextAssignment_1()); 
            // InternalPDL.g:890:2: ( rule__Guidance__TextAssignment_1 )
            // InternalPDL.g:890:3: rule__Guidance__TextAssignment_1
            {
            pushFollow(FOLLOW_2);
            rule__Guidance__TextAssignment_1();

            state._fsp--;


            }

             after(grammarAccess.getGuidanceAccess().getTextAssignment_1()); 

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


    // $ANTLR start "rule__Ressource__Group__0"
    // InternalPDL.g:899:1: rule__Ressource__Group__0 : rule__Ressource__Group__0__Impl rule__Ressource__Group__1 ;
    public final void rule__Ressource__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:903:1: ( rule__Ressource__Group__0__Impl rule__Ressource__Group__1 )
            // InternalPDL.g:904:2: rule__Ressource__Group__0__Impl rule__Ressource__Group__1
            {
            pushFollow(FOLLOW_13);
            rule__Ressource__Group__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__Ressource__Group__1();

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
    // $ANTLR end "rule__Ressource__Group__0"


    // $ANTLR start "rule__Ressource__Group__0__Impl"
    // InternalPDL.g:911:1: rule__Ressource__Group__0__Impl : ( () ) ;
    public final void rule__Ressource__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:915:1: ( ( () ) )
            // InternalPDL.g:916:1: ( () )
            {
            // InternalPDL.g:916:1: ( () )
            // InternalPDL.g:917:2: ()
            {
             before(grammarAccess.getRessourceAccess().getRessourceAction_0()); 
            // InternalPDL.g:918:2: ()
            // InternalPDL.g:918:3: 
            {
            }

             after(grammarAccess.getRessourceAccess().getRessourceAction_0()); 

            }


            }

        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end "rule__Ressource__Group__0__Impl"


    // $ANTLR start "rule__Ressource__Group__1"
    // InternalPDL.g:926:1: rule__Ressource__Group__1 : rule__Ressource__Group__1__Impl rule__Ressource__Group__2 ;
    public final void rule__Ressource__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:930:1: ( rule__Ressource__Group__1__Impl rule__Ressource__Group__2 )
            // InternalPDL.g:931:2: rule__Ressource__Group__1__Impl rule__Ressource__Group__2
            {
            pushFollow(FOLLOW_4);
            rule__Ressource__Group__1__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__Ressource__Group__2();

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
    // $ANTLR end "rule__Ressource__Group__1"


    // $ANTLR start "rule__Ressource__Group__1__Impl"
    // InternalPDL.g:938:1: rule__Ressource__Group__1__Impl : ( 'rs' ) ;
    public final void rule__Ressource__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:942:1: ( ( 'rs' ) )
            // InternalPDL.g:943:1: ( 'rs' )
            {
            // InternalPDL.g:943:1: ( 'rs' )
            // InternalPDL.g:944:2: 'rs'
            {
             before(grammarAccess.getRessourceAccess().getRsKeyword_1()); 
            match(input,24,FOLLOW_2); 
             after(grammarAccess.getRessourceAccess().getRsKeyword_1()); 

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
    // $ANTLR end "rule__Ressource__Group__1__Impl"


    // $ANTLR start "rule__Ressource__Group__2"
    // InternalPDL.g:953:1: rule__Ressource__Group__2 : rule__Ressource__Group__2__Impl rule__Ressource__Group__3 ;
    public final void rule__Ressource__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:957:1: ( rule__Ressource__Group__2__Impl rule__Ressource__Group__3 )
            // InternalPDL.g:958:2: rule__Ressource__Group__2__Impl rule__Ressource__Group__3
            {
            pushFollow(FOLLOW_14);
            rule__Ressource__Group__2__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__Ressource__Group__3();

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
    // $ANTLR end "rule__Ressource__Group__2"


    // $ANTLR start "rule__Ressource__Group__2__Impl"
    // InternalPDL.g:965:1: rule__Ressource__Group__2__Impl : ( ( rule__Ressource__NameAssignment_2 ) ) ;
    public final void rule__Ressource__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:969:1: ( ( ( rule__Ressource__NameAssignment_2 ) ) )
            // InternalPDL.g:970:1: ( ( rule__Ressource__NameAssignment_2 ) )
            {
            // InternalPDL.g:970:1: ( ( rule__Ressource__NameAssignment_2 ) )
            // InternalPDL.g:971:2: ( rule__Ressource__NameAssignment_2 )
            {
             before(grammarAccess.getRessourceAccess().getNameAssignment_2()); 
            // InternalPDL.g:972:2: ( rule__Ressource__NameAssignment_2 )
            // InternalPDL.g:972:3: rule__Ressource__NameAssignment_2
            {
            pushFollow(FOLLOW_2);
            rule__Ressource__NameAssignment_2();

            state._fsp--;


            }

             after(grammarAccess.getRessourceAccess().getNameAssignment_2()); 

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
    // $ANTLR end "rule__Ressource__Group__2__Impl"


    // $ANTLR start "rule__Ressource__Group__3"
    // InternalPDL.g:980:1: rule__Ressource__Group__3 : rule__Ressource__Group__3__Impl ;
    public final void rule__Ressource__Group__3() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:984:1: ( rule__Ressource__Group__3__Impl )
            // InternalPDL.g:985:2: rule__Ressource__Group__3__Impl
            {
            pushFollow(FOLLOW_2);
            rule__Ressource__Group__3__Impl();

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
    // $ANTLR end "rule__Ressource__Group__3"


    // $ANTLR start "rule__Ressource__Group__3__Impl"
    // InternalPDL.g:991:1: rule__Ressource__Group__3__Impl : ( ( rule__Ressource__QuantiteAssignment_3 ) ) ;
    public final void rule__Ressource__Group__3__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:995:1: ( ( ( rule__Ressource__QuantiteAssignment_3 ) ) )
            // InternalPDL.g:996:1: ( ( rule__Ressource__QuantiteAssignment_3 ) )
            {
            // InternalPDL.g:996:1: ( ( rule__Ressource__QuantiteAssignment_3 ) )
            // InternalPDL.g:997:2: ( rule__Ressource__QuantiteAssignment_3 )
            {
             before(grammarAccess.getRessourceAccess().getQuantiteAssignment_3()); 
            // InternalPDL.g:998:2: ( rule__Ressource__QuantiteAssignment_3 )
            // InternalPDL.g:998:3: rule__Ressource__QuantiteAssignment_3
            {
            pushFollow(FOLLOW_2);
            rule__Ressource__QuantiteAssignment_3();

            state._fsp--;


            }

             after(grammarAccess.getRessourceAccess().getQuantiteAssignment_3()); 

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
    // $ANTLR end "rule__Ressource__Group__3__Impl"


    // $ANTLR start "rule__EInt__Group__0"
    // InternalPDL.g:1007:1: rule__EInt__Group__0 : rule__EInt__Group__0__Impl rule__EInt__Group__1 ;
    public final void rule__EInt__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1011:1: ( rule__EInt__Group__0__Impl rule__EInt__Group__1 )
            // InternalPDL.g:1012:2: rule__EInt__Group__0__Impl rule__EInt__Group__1
            {
            pushFollow(FOLLOW_14);
            rule__EInt__Group__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__EInt__Group__1();

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
    // $ANTLR end "rule__EInt__Group__0"


    // $ANTLR start "rule__EInt__Group__0__Impl"
    // InternalPDL.g:1019:1: rule__EInt__Group__0__Impl : ( ( '-' )? ) ;
    public final void rule__EInt__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1023:1: ( ( ( '-' )? ) )
            // InternalPDL.g:1024:1: ( ( '-' )? )
            {
            // InternalPDL.g:1024:1: ( ( '-' )? )
            // InternalPDL.g:1025:2: ( '-' )?
            {
             before(grammarAccess.getEIntAccess().getHyphenMinusKeyword_0()); 
            // InternalPDL.g:1026:2: ( '-' )?
            int alt5=2;
            int LA5_0 = input.LA(1);

            if ( (LA5_0==25) ) {
                alt5=1;
            }
            switch (alt5) {
                case 1 :
                    // InternalPDL.g:1026:3: '-'
                    {
                    match(input,25,FOLLOW_2); 

                    }
                    break;

            }

             after(grammarAccess.getEIntAccess().getHyphenMinusKeyword_0()); 

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
    // $ANTLR end "rule__EInt__Group__0__Impl"


    // $ANTLR start "rule__EInt__Group__1"
    // InternalPDL.g:1034:1: rule__EInt__Group__1 : rule__EInt__Group__1__Impl ;
    public final void rule__EInt__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1038:1: ( rule__EInt__Group__1__Impl )
            // InternalPDL.g:1039:2: rule__EInt__Group__1__Impl
            {
            pushFollow(FOLLOW_2);
            rule__EInt__Group__1__Impl();

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
    // $ANTLR end "rule__EInt__Group__1"


    // $ANTLR start "rule__EInt__Group__1__Impl"
    // InternalPDL.g:1045:1: rule__EInt__Group__1__Impl : ( RULE_INT ) ;
    public final void rule__EInt__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1049:1: ( ( RULE_INT ) )
            // InternalPDL.g:1050:1: ( RULE_INT )
            {
            // InternalPDL.g:1050:1: ( RULE_INT )
            // InternalPDL.g:1051:2: RULE_INT
            {
             before(grammarAccess.getEIntAccess().getINTTerminalRuleCall_1()); 
            match(input,RULE_INT,FOLLOW_2); 
             after(grammarAccess.getEIntAccess().getINTTerminalRuleCall_1()); 

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
    // $ANTLR end "rule__EInt__Group__1__Impl"


    // $ANTLR start "rule__Process__NameAssignment_2"
    // InternalPDL.g:1061:1: rule__Process__NameAssignment_2 : ( ruleEString ) ;
    public final void rule__Process__NameAssignment_2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1065:1: ( ( ruleEString ) )
            // InternalPDL.g:1066:2: ( ruleEString )
            {
            // InternalPDL.g:1066:2: ( ruleEString )
            // InternalPDL.g:1067:3: ruleEString
            {
             before(grammarAccess.getProcessAccess().getNameEStringParserRuleCall_2_0()); 
            pushFollow(FOLLOW_2);
            ruleEString();

            state._fsp--;

             after(grammarAccess.getProcessAccess().getNameEStringParserRuleCall_2_0()); 

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
    // $ANTLR end "rule__Process__NameAssignment_2"


    // $ANTLR start "rule__Process__ProcessElementsAssignment_4"
    // InternalPDL.g:1076:1: rule__Process__ProcessElementsAssignment_4 : ( ruleProcessElement ) ;
    public final void rule__Process__ProcessElementsAssignment_4() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1080:1: ( ( ruleProcessElement ) )
            // InternalPDL.g:1081:2: ( ruleProcessElement )
            {
            // InternalPDL.g:1081:2: ( ruleProcessElement )
            // InternalPDL.g:1082:3: ruleProcessElement
            {
             before(grammarAccess.getProcessAccess().getProcessElementsProcessElementParserRuleCall_4_0()); 
            pushFollow(FOLLOW_2);
            ruleProcessElement();

            state._fsp--;

             after(grammarAccess.getProcessAccess().getProcessElementsProcessElementParserRuleCall_4_0()); 

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
    // $ANTLR end "rule__Process__ProcessElementsAssignment_4"


    // $ANTLR start "rule__WorkDefinition__NameAssignment_2"
    // InternalPDL.g:1091:1: rule__WorkDefinition__NameAssignment_2 : ( ruleEString ) ;
    public final void rule__WorkDefinition__NameAssignment_2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1095:1: ( ( ruleEString ) )
            // InternalPDL.g:1096:2: ( ruleEString )
            {
            // InternalPDL.g:1096:2: ( ruleEString )
            // InternalPDL.g:1097:3: ruleEString
            {
             before(grammarAccess.getWorkDefinitionAccess().getNameEStringParserRuleCall_2_0()); 
            pushFollow(FOLLOW_2);
            ruleEString();

            state._fsp--;

             after(grammarAccess.getWorkDefinitionAccess().getNameEStringParserRuleCall_2_0()); 

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
    // $ANTLR end "rule__WorkDefinition__NameAssignment_2"


    // $ANTLR start "rule__WorkSequence__LinkTypeAssignment_1"
    // InternalPDL.g:1106:1: rule__WorkSequence__LinkTypeAssignment_1 : ( ruleWorkSequenceType ) ;
    public final void rule__WorkSequence__LinkTypeAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1110:1: ( ( ruleWorkSequenceType ) )
            // InternalPDL.g:1111:2: ( ruleWorkSequenceType )
            {
            // InternalPDL.g:1111:2: ( ruleWorkSequenceType )
            // InternalPDL.g:1112:3: ruleWorkSequenceType
            {
             before(grammarAccess.getWorkSequenceAccess().getLinkTypeWorkSequenceTypeEnumRuleCall_1_0()); 
            pushFollow(FOLLOW_2);
            ruleWorkSequenceType();

            state._fsp--;

             after(grammarAccess.getWorkSequenceAccess().getLinkTypeWorkSequenceTypeEnumRuleCall_1_0()); 

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
    // $ANTLR end "rule__WorkSequence__LinkTypeAssignment_1"


    // $ANTLR start "rule__WorkSequence__PredecessorAssignment_3"
    // InternalPDL.g:1121:1: rule__WorkSequence__PredecessorAssignment_3 : ( ( ruleEString ) ) ;
    public final void rule__WorkSequence__PredecessorAssignment_3() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1125:1: ( ( ( ruleEString ) ) )
            // InternalPDL.g:1126:2: ( ( ruleEString ) )
            {
            // InternalPDL.g:1126:2: ( ( ruleEString ) )
            // InternalPDL.g:1127:3: ( ruleEString )
            {
             before(grammarAccess.getWorkSequenceAccess().getPredecessorWorkDefinitionCrossReference_3_0()); 
            // InternalPDL.g:1128:3: ( ruleEString )
            // InternalPDL.g:1129:4: ruleEString
            {
             before(grammarAccess.getWorkSequenceAccess().getPredecessorWorkDefinitionEStringParserRuleCall_3_0_1()); 
            pushFollow(FOLLOW_2);
            ruleEString();

            state._fsp--;

             after(grammarAccess.getWorkSequenceAccess().getPredecessorWorkDefinitionEStringParserRuleCall_3_0_1()); 

            }

             after(grammarAccess.getWorkSequenceAccess().getPredecessorWorkDefinitionCrossReference_3_0()); 

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
    // $ANTLR end "rule__WorkSequence__PredecessorAssignment_3"


    // $ANTLR start "rule__WorkSequence__SuccessorAssignment_5"
    // InternalPDL.g:1140:1: rule__WorkSequence__SuccessorAssignment_5 : ( ( ruleEString ) ) ;
    public final void rule__WorkSequence__SuccessorAssignment_5() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1144:1: ( ( ( ruleEString ) ) )
            // InternalPDL.g:1145:2: ( ( ruleEString ) )
            {
            // InternalPDL.g:1145:2: ( ( ruleEString ) )
            // InternalPDL.g:1146:3: ( ruleEString )
            {
             before(grammarAccess.getWorkSequenceAccess().getSuccessorWorkDefinitionCrossReference_5_0()); 
            // InternalPDL.g:1147:3: ( ruleEString )
            // InternalPDL.g:1148:4: ruleEString
            {
             before(grammarAccess.getWorkSequenceAccess().getSuccessorWorkDefinitionEStringParserRuleCall_5_0_1()); 
            pushFollow(FOLLOW_2);
            ruleEString();

            state._fsp--;

             after(grammarAccess.getWorkSequenceAccess().getSuccessorWorkDefinitionEStringParserRuleCall_5_0_1()); 

            }

             after(grammarAccess.getWorkSequenceAccess().getSuccessorWorkDefinitionCrossReference_5_0()); 

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
    // $ANTLR end "rule__WorkSequence__SuccessorAssignment_5"


    // $ANTLR start "rule__Guidance__TextAssignment_1"
    // InternalPDL.g:1159:1: rule__Guidance__TextAssignment_1 : ( ruleEString ) ;
    public final void rule__Guidance__TextAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1163:1: ( ( ruleEString ) )
            // InternalPDL.g:1164:2: ( ruleEString )
            {
            // InternalPDL.g:1164:2: ( ruleEString )
            // InternalPDL.g:1165:3: ruleEString
            {
             before(grammarAccess.getGuidanceAccess().getTextEStringParserRuleCall_1_0()); 
            pushFollow(FOLLOW_2);
            ruleEString();

            state._fsp--;

             after(grammarAccess.getGuidanceAccess().getTextEStringParserRuleCall_1_0()); 

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
    // $ANTLR end "rule__Guidance__TextAssignment_1"


    // $ANTLR start "rule__Ressource__NameAssignment_2"
    // InternalPDL.g:1174:1: rule__Ressource__NameAssignment_2 : ( ruleEString ) ;
    public final void rule__Ressource__NameAssignment_2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1178:1: ( ( ruleEString ) )
            // InternalPDL.g:1179:2: ( ruleEString )
            {
            // InternalPDL.g:1179:2: ( ruleEString )
            // InternalPDL.g:1180:3: ruleEString
            {
             before(grammarAccess.getRessourceAccess().getNameEStringParserRuleCall_2_0()); 
            pushFollow(FOLLOW_2);
            ruleEString();

            state._fsp--;

             after(grammarAccess.getRessourceAccess().getNameEStringParserRuleCall_2_0()); 

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
    // $ANTLR end "rule__Ressource__NameAssignment_2"


    // $ANTLR start "rule__Ressource__QuantiteAssignment_3"
    // InternalPDL.g:1189:1: rule__Ressource__QuantiteAssignment_3 : ( ruleEInt ) ;
    public final void rule__Ressource__QuantiteAssignment_3() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL.g:1193:1: ( ( ruleEInt ) )
            // InternalPDL.g:1194:2: ( ruleEInt )
            {
            // InternalPDL.g:1194:2: ( ruleEInt )
            // InternalPDL.g:1195:3: ruleEInt
            {
             before(grammarAccess.getRessourceAccess().getQuantiteEIntParserRuleCall_3_0()); 
            pushFollow(FOLLOW_2);
            ruleEInt();

            state._fsp--;

             after(grammarAccess.getRessourceAccess().getQuantiteEIntParserRuleCall_3_0()); 

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
    // $ANTLR end "rule__Ressource__QuantiteAssignment_3"

    // Delegated rules


 

    public static final BitSet FOLLOW_1 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_2 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_3 = new BitSet(new long[]{0x0000000000008000L});
    public static final BitSet FOLLOW_4 = new BitSet(new long[]{0x0000000000000030L});
    public static final BitSet FOLLOW_5 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_6 = new BitSet(new long[]{0x00000000019E0000L});
    public static final BitSet FOLLOW_7 = new BitSet(new long[]{0x00000000019C0002L});
    public static final BitSet FOLLOW_8 = new BitSet(new long[]{0x0000000000040000L});
    public static final BitSet FOLLOW_9 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_10 = new BitSet(new long[]{0x0000000000007800L});
    public static final BitSet FOLLOW_11 = new BitSet(new long[]{0x0000000000200000L});
    public static final BitSet FOLLOW_12 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_13 = new BitSet(new long[]{0x00000000019C0000L});
    public static final BitSet FOLLOW_14 = new BitSet(new long[]{0x0000000002000040L});

}