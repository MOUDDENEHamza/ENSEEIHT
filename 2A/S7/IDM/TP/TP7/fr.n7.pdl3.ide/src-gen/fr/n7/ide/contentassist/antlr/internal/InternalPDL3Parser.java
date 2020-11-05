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
import fr.n7.services.PDL3GrammarAccess;



import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("all")
public class InternalPDL3Parser extends AbstractInternalContentAssistParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "RULE_ID", "RULE_INT", "RULE_STRING", "RULE_ML_COMMENT", "RULE_SL_COMMENT", "RULE_WS", "RULE_ANY_OTHER", "' s2s '", "' f2s '", "' s2f '", "' f2f '", "'process : '", "'workdefinitions : '", "'worksequences : '", "'; '"
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

    	public void setGrammarAccess(PDL3GrammarAccess grammarAccess) {
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
    // InternalPDL3.g:53:1: entryRuleProcess : ruleProcess EOF ;
    public final void entryRuleProcess() throws RecognitionException {
        try {
            // InternalPDL3.g:54:1: ( ruleProcess EOF )
            // InternalPDL3.g:55:1: ruleProcess EOF
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
    // InternalPDL3.g:62:1: ruleProcess : ( ( rule__Process__Group__0 ) ) ;
    public final void ruleProcess() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:66:2: ( ( ( rule__Process__Group__0 ) ) )
            // InternalPDL3.g:67:2: ( ( rule__Process__Group__0 ) )
            {
            // InternalPDL3.g:67:2: ( ( rule__Process__Group__0 ) )
            // InternalPDL3.g:68:3: ( rule__Process__Group__0 )
            {
             before(grammarAccess.getProcessAccess().getGroup()); 
            // InternalPDL3.g:69:3: ( rule__Process__Group__0 )
            // InternalPDL3.g:69:4: rule__Process__Group__0
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
    // InternalPDL3.g:78:1: entryRuleProcessElement : ruleProcessElement EOF ;
    public final void entryRuleProcessElement() throws RecognitionException {
        try {
            // InternalPDL3.g:79:1: ( ruleProcessElement EOF )
            // InternalPDL3.g:80:1: ruleProcessElement EOF
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
    // InternalPDL3.g:87:1: ruleProcessElement : ( ( rule__ProcessElement__Alternatives ) ) ;
    public final void ruleProcessElement() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:91:2: ( ( ( rule__ProcessElement__Alternatives ) ) )
            // InternalPDL3.g:92:2: ( ( rule__ProcessElement__Alternatives ) )
            {
            // InternalPDL3.g:92:2: ( ( rule__ProcessElement__Alternatives ) )
            // InternalPDL3.g:93:3: ( rule__ProcessElement__Alternatives )
            {
             before(grammarAccess.getProcessElementAccess().getAlternatives()); 
            // InternalPDL3.g:94:3: ( rule__ProcessElement__Alternatives )
            // InternalPDL3.g:94:4: rule__ProcessElement__Alternatives
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
    // InternalPDL3.g:103:1: entryRuleWorkDefinition : ruleWorkDefinition EOF ;
    public final void entryRuleWorkDefinition() throws RecognitionException {
        try {
            // InternalPDL3.g:104:1: ( ruleWorkDefinition EOF )
            // InternalPDL3.g:105:1: ruleWorkDefinition EOF
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
    // InternalPDL3.g:112:1: ruleWorkDefinition : ( ( rule__WorkDefinition__Group__0 ) ) ;
    public final void ruleWorkDefinition() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:116:2: ( ( ( rule__WorkDefinition__Group__0 ) ) )
            // InternalPDL3.g:117:2: ( ( rule__WorkDefinition__Group__0 ) )
            {
            // InternalPDL3.g:117:2: ( ( rule__WorkDefinition__Group__0 ) )
            // InternalPDL3.g:118:3: ( rule__WorkDefinition__Group__0 )
            {
             before(grammarAccess.getWorkDefinitionAccess().getGroup()); 
            // InternalPDL3.g:119:3: ( rule__WorkDefinition__Group__0 )
            // InternalPDL3.g:119:4: rule__WorkDefinition__Group__0
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
    // InternalPDL3.g:128:1: entryRuleWorkSequence : ruleWorkSequence EOF ;
    public final void entryRuleWorkSequence() throws RecognitionException {
        try {
            // InternalPDL3.g:129:1: ( ruleWorkSequence EOF )
            // InternalPDL3.g:130:1: ruleWorkSequence EOF
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
    // InternalPDL3.g:137:1: ruleWorkSequence : ( ( rule__WorkSequence__Group__0 ) ) ;
    public final void ruleWorkSequence() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:141:2: ( ( ( rule__WorkSequence__Group__0 ) ) )
            // InternalPDL3.g:142:2: ( ( rule__WorkSequence__Group__0 ) )
            {
            // InternalPDL3.g:142:2: ( ( rule__WorkSequence__Group__0 ) )
            // InternalPDL3.g:143:3: ( rule__WorkSequence__Group__0 )
            {
             before(grammarAccess.getWorkSequenceAccess().getGroup()); 
            // InternalPDL3.g:144:3: ( rule__WorkSequence__Group__0 )
            // InternalPDL3.g:144:4: rule__WorkSequence__Group__0
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


    // $ANTLR start "ruleWorkSequenceType"
    // InternalPDL3.g:153:1: ruleWorkSequenceType : ( ( rule__WorkSequenceType__Alternatives ) ) ;
    public final void ruleWorkSequenceType() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:157:1: ( ( ( rule__WorkSequenceType__Alternatives ) ) )
            // InternalPDL3.g:158:2: ( ( rule__WorkSequenceType__Alternatives ) )
            {
            // InternalPDL3.g:158:2: ( ( rule__WorkSequenceType__Alternatives ) )
            // InternalPDL3.g:159:3: ( rule__WorkSequenceType__Alternatives )
            {
             before(grammarAccess.getWorkSequenceTypeAccess().getAlternatives()); 
            // InternalPDL3.g:160:3: ( rule__WorkSequenceType__Alternatives )
            // InternalPDL3.g:160:4: rule__WorkSequenceType__Alternatives
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
    // InternalPDL3.g:168:1: rule__ProcessElement__Alternatives : ( ( ( rule__ProcessElement__Group_0__0 ) ) | ( ( rule__ProcessElement__Group_1__0 ) ) );
    public final void rule__ProcessElement__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:172:1: ( ( ( rule__ProcessElement__Group_0__0 ) ) | ( ( rule__ProcessElement__Group_1__0 ) ) )
            int alt1=2;
            int LA1_0 = input.LA(1);

            if ( (LA1_0==16) ) {
                alt1=1;
            }
            else if ( (LA1_0==17) ) {
                alt1=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 1, 0, input);

                throw nvae;
            }
            switch (alt1) {
                case 1 :
                    // InternalPDL3.g:173:2: ( ( rule__ProcessElement__Group_0__0 ) )
                    {
                    // InternalPDL3.g:173:2: ( ( rule__ProcessElement__Group_0__0 ) )
                    // InternalPDL3.g:174:3: ( rule__ProcessElement__Group_0__0 )
                    {
                     before(grammarAccess.getProcessElementAccess().getGroup_0()); 
                    // InternalPDL3.g:175:3: ( rule__ProcessElement__Group_0__0 )
                    // InternalPDL3.g:175:4: rule__ProcessElement__Group_0__0
                    {
                    pushFollow(FOLLOW_2);
                    rule__ProcessElement__Group_0__0();

                    state._fsp--;


                    }

                     after(grammarAccess.getProcessElementAccess().getGroup_0()); 

                    }


                    }
                    break;
                case 2 :
                    // InternalPDL3.g:179:2: ( ( rule__ProcessElement__Group_1__0 ) )
                    {
                    // InternalPDL3.g:179:2: ( ( rule__ProcessElement__Group_1__0 ) )
                    // InternalPDL3.g:180:3: ( rule__ProcessElement__Group_1__0 )
                    {
                     before(grammarAccess.getProcessElementAccess().getGroup_1()); 
                    // InternalPDL3.g:181:3: ( rule__ProcessElement__Group_1__0 )
                    // InternalPDL3.g:181:4: rule__ProcessElement__Group_1__0
                    {
                    pushFollow(FOLLOW_2);
                    rule__ProcessElement__Group_1__0();

                    state._fsp--;


                    }

                     after(grammarAccess.getProcessElementAccess().getGroup_1()); 

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


    // $ANTLR start "rule__WorkSequenceType__Alternatives"
    // InternalPDL3.g:189:1: rule__WorkSequenceType__Alternatives : ( ( ( ' s2s ' ) ) | ( ( ' f2s ' ) ) | ( ( ' s2f ' ) ) | ( ( ' f2f ' ) ) );
    public final void rule__WorkSequenceType__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:193:1: ( ( ( ' s2s ' ) ) | ( ( ' f2s ' ) ) | ( ( ' s2f ' ) ) | ( ( ' f2f ' ) ) )
            int alt2=4;
            switch ( input.LA(1) ) {
            case 11:
                {
                alt2=1;
                }
                break;
            case 12:
                {
                alt2=2;
                }
                break;
            case 13:
                {
                alt2=3;
                }
                break;
            case 14:
                {
                alt2=4;
                }
                break;
            default:
                NoViableAltException nvae =
                    new NoViableAltException("", 2, 0, input);

                throw nvae;
            }

            switch (alt2) {
                case 1 :
                    // InternalPDL3.g:194:2: ( ( ' s2s ' ) )
                    {
                    // InternalPDL3.g:194:2: ( ( ' s2s ' ) )
                    // InternalPDL3.g:195:3: ( ' s2s ' )
                    {
                     before(grammarAccess.getWorkSequenceTypeAccess().getStart2startEnumLiteralDeclaration_0()); 
                    // InternalPDL3.g:196:3: ( ' s2s ' )
                    // InternalPDL3.g:196:4: ' s2s '
                    {
                    match(input,11,FOLLOW_2); 

                    }

                     after(grammarAccess.getWorkSequenceTypeAccess().getStart2startEnumLiteralDeclaration_0()); 

                    }


                    }
                    break;
                case 2 :
                    // InternalPDL3.g:200:2: ( ( ' f2s ' ) )
                    {
                    // InternalPDL3.g:200:2: ( ( ' f2s ' ) )
                    // InternalPDL3.g:201:3: ( ' f2s ' )
                    {
                     before(grammarAccess.getWorkSequenceTypeAccess().getFinish2startEnumLiteralDeclaration_1()); 
                    // InternalPDL3.g:202:3: ( ' f2s ' )
                    // InternalPDL3.g:202:4: ' f2s '
                    {
                    match(input,12,FOLLOW_2); 

                    }

                     after(grammarAccess.getWorkSequenceTypeAccess().getFinish2startEnumLiteralDeclaration_1()); 

                    }


                    }
                    break;
                case 3 :
                    // InternalPDL3.g:206:2: ( ( ' s2f ' ) )
                    {
                    // InternalPDL3.g:206:2: ( ( ' s2f ' ) )
                    // InternalPDL3.g:207:3: ( ' s2f ' )
                    {
                     before(grammarAccess.getWorkSequenceTypeAccess().getStart2finishEnumLiteralDeclaration_2()); 
                    // InternalPDL3.g:208:3: ( ' s2f ' )
                    // InternalPDL3.g:208:4: ' s2f '
                    {
                    match(input,13,FOLLOW_2); 

                    }

                     after(grammarAccess.getWorkSequenceTypeAccess().getStart2finishEnumLiteralDeclaration_2()); 

                    }


                    }
                    break;
                case 4 :
                    // InternalPDL3.g:212:2: ( ( ' f2f ' ) )
                    {
                    // InternalPDL3.g:212:2: ( ( ' f2f ' ) )
                    // InternalPDL3.g:213:3: ( ' f2f ' )
                    {
                     before(grammarAccess.getWorkSequenceTypeAccess().getFinish2finishEnumLiteralDeclaration_3()); 
                    // InternalPDL3.g:214:3: ( ' f2f ' )
                    // InternalPDL3.g:214:4: ' f2f '
                    {
                    match(input,14,FOLLOW_2); 

                    }

                     after(grammarAccess.getWorkSequenceTypeAccess().getFinish2finishEnumLiteralDeclaration_3()); 

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
    // InternalPDL3.g:222:1: rule__Process__Group__0 : rule__Process__Group__0__Impl rule__Process__Group__1 ;
    public final void rule__Process__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:226:1: ( rule__Process__Group__0__Impl rule__Process__Group__1 )
            // InternalPDL3.g:227:2: rule__Process__Group__0__Impl rule__Process__Group__1
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
    // InternalPDL3.g:234:1: rule__Process__Group__0__Impl : ( 'process : ' ) ;
    public final void rule__Process__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:238:1: ( ( 'process : ' ) )
            // InternalPDL3.g:239:1: ( 'process : ' )
            {
            // InternalPDL3.g:239:1: ( 'process : ' )
            // InternalPDL3.g:240:2: 'process : '
            {
             before(grammarAccess.getProcessAccess().getProcessKeyword_0()); 
            match(input,15,FOLLOW_2); 
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
    // InternalPDL3.g:249:1: rule__Process__Group__1 : rule__Process__Group__1__Impl rule__Process__Group__2 ;
    public final void rule__Process__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:253:1: ( rule__Process__Group__1__Impl rule__Process__Group__2 )
            // InternalPDL3.g:254:2: rule__Process__Group__1__Impl rule__Process__Group__2
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
    // InternalPDL3.g:261:1: rule__Process__Group__1__Impl : ( ( rule__Process__NameAssignment_1 ) ) ;
    public final void rule__Process__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:265:1: ( ( ( rule__Process__NameAssignment_1 ) ) )
            // InternalPDL3.g:266:1: ( ( rule__Process__NameAssignment_1 ) )
            {
            // InternalPDL3.g:266:1: ( ( rule__Process__NameAssignment_1 ) )
            // InternalPDL3.g:267:2: ( rule__Process__NameAssignment_1 )
            {
             before(grammarAccess.getProcessAccess().getNameAssignment_1()); 
            // InternalPDL3.g:268:2: ( rule__Process__NameAssignment_1 )
            // InternalPDL3.g:268:3: rule__Process__NameAssignment_1
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
    // InternalPDL3.g:276:1: rule__Process__Group__2 : rule__Process__Group__2__Impl ;
    public final void rule__Process__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:280:1: ( rule__Process__Group__2__Impl )
            // InternalPDL3.g:281:2: rule__Process__Group__2__Impl
            {
            pushFollow(FOLLOW_2);
            rule__Process__Group__2__Impl();

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
    // InternalPDL3.g:287:1: rule__Process__Group__2__Impl : ( ( rule__Process__ProcessElementsAssignment_2 )* ) ;
    public final void rule__Process__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:291:1: ( ( ( rule__Process__ProcessElementsAssignment_2 )* ) )
            // InternalPDL3.g:292:1: ( ( rule__Process__ProcessElementsAssignment_2 )* )
            {
            // InternalPDL3.g:292:1: ( ( rule__Process__ProcessElementsAssignment_2 )* )
            // InternalPDL3.g:293:2: ( rule__Process__ProcessElementsAssignment_2 )*
            {
             before(grammarAccess.getProcessAccess().getProcessElementsAssignment_2()); 
            // InternalPDL3.g:294:2: ( rule__Process__ProcessElementsAssignment_2 )*
            loop3:
            do {
                int alt3=2;
                int LA3_0 = input.LA(1);

                if ( ((LA3_0>=16 && LA3_0<=17)) ) {
                    alt3=1;
                }


                switch (alt3) {
            	case 1 :
            	    // InternalPDL3.g:294:3: rule__Process__ProcessElementsAssignment_2
            	    {
            	    pushFollow(FOLLOW_5);
            	    rule__Process__ProcessElementsAssignment_2();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop3;
                }
            } while (true);

             after(grammarAccess.getProcessAccess().getProcessElementsAssignment_2()); 

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


    // $ANTLR start "rule__ProcessElement__Group_0__0"
    // InternalPDL3.g:303:1: rule__ProcessElement__Group_0__0 : rule__ProcessElement__Group_0__0__Impl rule__ProcessElement__Group_0__1 ;
    public final void rule__ProcessElement__Group_0__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:307:1: ( rule__ProcessElement__Group_0__0__Impl rule__ProcessElement__Group_0__1 )
            // InternalPDL3.g:308:2: rule__ProcessElement__Group_0__0__Impl rule__ProcessElement__Group_0__1
            {
            pushFollow(FOLLOW_3);
            rule__ProcessElement__Group_0__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__ProcessElement__Group_0__1();

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
    // $ANTLR end "rule__ProcessElement__Group_0__0"


    // $ANTLR start "rule__ProcessElement__Group_0__0__Impl"
    // InternalPDL3.g:315:1: rule__ProcessElement__Group_0__0__Impl : ( 'workdefinitions : ' ) ;
    public final void rule__ProcessElement__Group_0__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:319:1: ( ( 'workdefinitions : ' ) )
            // InternalPDL3.g:320:1: ( 'workdefinitions : ' )
            {
            // InternalPDL3.g:320:1: ( 'workdefinitions : ' )
            // InternalPDL3.g:321:2: 'workdefinitions : '
            {
             before(grammarAccess.getProcessElementAccess().getWorkdefinitionsKeyword_0_0()); 
            match(input,16,FOLLOW_2); 
             after(grammarAccess.getProcessElementAccess().getWorkdefinitionsKeyword_0_0()); 

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
    // $ANTLR end "rule__ProcessElement__Group_0__0__Impl"


    // $ANTLR start "rule__ProcessElement__Group_0__1"
    // InternalPDL3.g:330:1: rule__ProcessElement__Group_0__1 : rule__ProcessElement__Group_0__1__Impl ;
    public final void rule__ProcessElement__Group_0__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:334:1: ( rule__ProcessElement__Group_0__1__Impl )
            // InternalPDL3.g:335:2: rule__ProcessElement__Group_0__1__Impl
            {
            pushFollow(FOLLOW_2);
            rule__ProcessElement__Group_0__1__Impl();

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
    // $ANTLR end "rule__ProcessElement__Group_0__1"


    // $ANTLR start "rule__ProcessElement__Group_0__1__Impl"
    // InternalPDL3.g:341:1: rule__ProcessElement__Group_0__1__Impl : ( ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 ) ) ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 )* ) ) ;
    public final void rule__ProcessElement__Group_0__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:345:1: ( ( ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 ) ) ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 )* ) ) )
            // InternalPDL3.g:346:1: ( ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 ) ) ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 )* ) )
            {
            // InternalPDL3.g:346:1: ( ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 ) ) ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 )* ) )
            // InternalPDL3.g:347:2: ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 ) ) ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 )* )
            {
            // InternalPDL3.g:347:2: ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 ) )
            // InternalPDL3.g:348:3: ( rule__ProcessElement__WorkDefinitionAssignment_0_1 )
            {
             before(grammarAccess.getProcessElementAccess().getWorkDefinitionAssignment_0_1()); 
            // InternalPDL3.g:349:3: ( rule__ProcessElement__WorkDefinitionAssignment_0_1 )
            // InternalPDL3.g:349:4: rule__ProcessElement__WorkDefinitionAssignment_0_1
            {
            pushFollow(FOLLOW_6);
            rule__ProcessElement__WorkDefinitionAssignment_0_1();

            state._fsp--;


            }

             after(grammarAccess.getProcessElementAccess().getWorkDefinitionAssignment_0_1()); 

            }

            // InternalPDL3.g:352:2: ( ( rule__ProcessElement__WorkDefinitionAssignment_0_1 )* )
            // InternalPDL3.g:353:3: ( rule__ProcessElement__WorkDefinitionAssignment_0_1 )*
            {
             before(grammarAccess.getProcessElementAccess().getWorkDefinitionAssignment_0_1()); 
            // InternalPDL3.g:354:3: ( rule__ProcessElement__WorkDefinitionAssignment_0_1 )*
            loop4:
            do {
                int alt4=2;
                int LA4_0 = input.LA(1);

                if ( (LA4_0==RULE_ID) ) {
                    alt4=1;
                }


                switch (alt4) {
            	case 1 :
            	    // InternalPDL3.g:354:4: rule__ProcessElement__WorkDefinitionAssignment_0_1
            	    {
            	    pushFollow(FOLLOW_6);
            	    rule__ProcessElement__WorkDefinitionAssignment_0_1();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop4;
                }
            } while (true);

             after(grammarAccess.getProcessElementAccess().getWorkDefinitionAssignment_0_1()); 

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
    // $ANTLR end "rule__ProcessElement__Group_0__1__Impl"


    // $ANTLR start "rule__ProcessElement__Group_1__0"
    // InternalPDL3.g:364:1: rule__ProcessElement__Group_1__0 : rule__ProcessElement__Group_1__0__Impl rule__ProcessElement__Group_1__1 ;
    public final void rule__ProcessElement__Group_1__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:368:1: ( rule__ProcessElement__Group_1__0__Impl rule__ProcessElement__Group_1__1 )
            // InternalPDL3.g:369:2: rule__ProcessElement__Group_1__0__Impl rule__ProcessElement__Group_1__1
            {
            pushFollow(FOLLOW_3);
            rule__ProcessElement__Group_1__0__Impl();

            state._fsp--;

            pushFollow(FOLLOW_2);
            rule__ProcessElement__Group_1__1();

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
    // $ANTLR end "rule__ProcessElement__Group_1__0"


    // $ANTLR start "rule__ProcessElement__Group_1__0__Impl"
    // InternalPDL3.g:376:1: rule__ProcessElement__Group_1__0__Impl : ( 'worksequences : ' ) ;
    public final void rule__ProcessElement__Group_1__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:380:1: ( ( 'worksequences : ' ) )
            // InternalPDL3.g:381:1: ( 'worksequences : ' )
            {
            // InternalPDL3.g:381:1: ( 'worksequences : ' )
            // InternalPDL3.g:382:2: 'worksequences : '
            {
             before(grammarAccess.getProcessElementAccess().getWorksequencesKeyword_1_0()); 
            match(input,17,FOLLOW_2); 
             after(grammarAccess.getProcessElementAccess().getWorksequencesKeyword_1_0()); 

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
    // $ANTLR end "rule__ProcessElement__Group_1__0__Impl"


    // $ANTLR start "rule__ProcessElement__Group_1__1"
    // InternalPDL3.g:391:1: rule__ProcessElement__Group_1__1 : rule__ProcessElement__Group_1__1__Impl ;
    public final void rule__ProcessElement__Group_1__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:395:1: ( rule__ProcessElement__Group_1__1__Impl )
            // InternalPDL3.g:396:2: rule__ProcessElement__Group_1__1__Impl
            {
            pushFollow(FOLLOW_2);
            rule__ProcessElement__Group_1__1__Impl();

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
    // $ANTLR end "rule__ProcessElement__Group_1__1"


    // $ANTLR start "rule__ProcessElement__Group_1__1__Impl"
    // InternalPDL3.g:402:1: rule__ProcessElement__Group_1__1__Impl : ( ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 ) ) ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 )* ) ) ;
    public final void rule__ProcessElement__Group_1__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:406:1: ( ( ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 ) ) ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 )* ) ) )
            // InternalPDL3.g:407:1: ( ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 ) ) ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 )* ) )
            {
            // InternalPDL3.g:407:1: ( ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 ) ) ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 )* ) )
            // InternalPDL3.g:408:2: ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 ) ) ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 )* )
            {
            // InternalPDL3.g:408:2: ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 ) )
            // InternalPDL3.g:409:3: ( rule__ProcessElement__WorkSequenceAssignment_1_1 )
            {
             before(grammarAccess.getProcessElementAccess().getWorkSequenceAssignment_1_1()); 
            // InternalPDL3.g:410:3: ( rule__ProcessElement__WorkSequenceAssignment_1_1 )
            // InternalPDL3.g:410:4: rule__ProcessElement__WorkSequenceAssignment_1_1
            {
            pushFollow(FOLLOW_6);
            rule__ProcessElement__WorkSequenceAssignment_1_1();

            state._fsp--;


            }

             after(grammarAccess.getProcessElementAccess().getWorkSequenceAssignment_1_1()); 

            }

            // InternalPDL3.g:413:2: ( ( rule__ProcessElement__WorkSequenceAssignment_1_1 )* )
            // InternalPDL3.g:414:3: ( rule__ProcessElement__WorkSequenceAssignment_1_1 )*
            {
             before(grammarAccess.getProcessElementAccess().getWorkSequenceAssignment_1_1()); 
            // InternalPDL3.g:415:3: ( rule__ProcessElement__WorkSequenceAssignment_1_1 )*
            loop5:
            do {
                int alt5=2;
                int LA5_0 = input.LA(1);

                if ( (LA5_0==RULE_ID) ) {
                    alt5=1;
                }


                switch (alt5) {
            	case 1 :
            	    // InternalPDL3.g:415:4: rule__ProcessElement__WorkSequenceAssignment_1_1
            	    {
            	    pushFollow(FOLLOW_6);
            	    rule__ProcessElement__WorkSequenceAssignment_1_1();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop5;
                }
            } while (true);

             after(grammarAccess.getProcessElementAccess().getWorkSequenceAssignment_1_1()); 

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
    // $ANTLR end "rule__ProcessElement__Group_1__1__Impl"


    // $ANTLR start "rule__WorkDefinition__Group__0"
    // InternalPDL3.g:425:1: rule__WorkDefinition__Group__0 : rule__WorkDefinition__Group__0__Impl rule__WorkDefinition__Group__1 ;
    public final void rule__WorkDefinition__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:429:1: ( rule__WorkDefinition__Group__0__Impl rule__WorkDefinition__Group__1 )
            // InternalPDL3.g:430:2: rule__WorkDefinition__Group__0__Impl rule__WorkDefinition__Group__1
            {
            pushFollow(FOLLOW_7);
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
    // InternalPDL3.g:437:1: rule__WorkDefinition__Group__0__Impl : ( ( rule__WorkDefinition__NameAssignment_0 ) ) ;
    public final void rule__WorkDefinition__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:441:1: ( ( ( rule__WorkDefinition__NameAssignment_0 ) ) )
            // InternalPDL3.g:442:1: ( ( rule__WorkDefinition__NameAssignment_0 ) )
            {
            // InternalPDL3.g:442:1: ( ( rule__WorkDefinition__NameAssignment_0 ) )
            // InternalPDL3.g:443:2: ( rule__WorkDefinition__NameAssignment_0 )
            {
             before(grammarAccess.getWorkDefinitionAccess().getNameAssignment_0()); 
            // InternalPDL3.g:444:2: ( rule__WorkDefinition__NameAssignment_0 )
            // InternalPDL3.g:444:3: rule__WorkDefinition__NameAssignment_0
            {
            pushFollow(FOLLOW_2);
            rule__WorkDefinition__NameAssignment_0();

            state._fsp--;


            }

             after(grammarAccess.getWorkDefinitionAccess().getNameAssignment_0()); 

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
    // InternalPDL3.g:452:1: rule__WorkDefinition__Group__1 : rule__WorkDefinition__Group__1__Impl ;
    public final void rule__WorkDefinition__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:456:1: ( rule__WorkDefinition__Group__1__Impl )
            // InternalPDL3.g:457:2: rule__WorkDefinition__Group__1__Impl
            {
            pushFollow(FOLLOW_2);
            rule__WorkDefinition__Group__1__Impl();

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
    // InternalPDL3.g:463:1: rule__WorkDefinition__Group__1__Impl : ( '; ' ) ;
    public final void rule__WorkDefinition__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:467:1: ( ( '; ' ) )
            // InternalPDL3.g:468:1: ( '; ' )
            {
            // InternalPDL3.g:468:1: ( '; ' )
            // InternalPDL3.g:469:2: '; '
            {
             before(grammarAccess.getWorkDefinitionAccess().getSemicolonSpaceKeyword_1()); 
            match(input,18,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getSemicolonSpaceKeyword_1()); 

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


    // $ANTLR start "rule__WorkSequence__Group__0"
    // InternalPDL3.g:479:1: rule__WorkSequence__Group__0 : rule__WorkSequence__Group__0__Impl rule__WorkSequence__Group__1 ;
    public final void rule__WorkSequence__Group__0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:483:1: ( rule__WorkSequence__Group__0__Impl rule__WorkSequence__Group__1 )
            // InternalPDL3.g:484:2: rule__WorkSequence__Group__0__Impl rule__WorkSequence__Group__1
            {
            pushFollow(FOLLOW_8);
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
    // InternalPDL3.g:491:1: rule__WorkSequence__Group__0__Impl : ( ( rule__WorkSequence__PredecessorAssignment_0 ) ) ;
    public final void rule__WorkSequence__Group__0__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:495:1: ( ( ( rule__WorkSequence__PredecessorAssignment_0 ) ) )
            // InternalPDL3.g:496:1: ( ( rule__WorkSequence__PredecessorAssignment_0 ) )
            {
            // InternalPDL3.g:496:1: ( ( rule__WorkSequence__PredecessorAssignment_0 ) )
            // InternalPDL3.g:497:2: ( rule__WorkSequence__PredecessorAssignment_0 )
            {
             before(grammarAccess.getWorkSequenceAccess().getPredecessorAssignment_0()); 
            // InternalPDL3.g:498:2: ( rule__WorkSequence__PredecessorAssignment_0 )
            // InternalPDL3.g:498:3: rule__WorkSequence__PredecessorAssignment_0
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequence__PredecessorAssignment_0();

            state._fsp--;


            }

             after(grammarAccess.getWorkSequenceAccess().getPredecessorAssignment_0()); 

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
    // InternalPDL3.g:506:1: rule__WorkSequence__Group__1 : rule__WorkSequence__Group__1__Impl rule__WorkSequence__Group__2 ;
    public final void rule__WorkSequence__Group__1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:510:1: ( rule__WorkSequence__Group__1__Impl rule__WorkSequence__Group__2 )
            // InternalPDL3.g:511:2: rule__WorkSequence__Group__1__Impl rule__WorkSequence__Group__2
            {
            pushFollow(FOLLOW_3);
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
    // InternalPDL3.g:518:1: rule__WorkSequence__Group__1__Impl : ( ( rule__WorkSequence__LinkTypeAssignment_1 ) ) ;
    public final void rule__WorkSequence__Group__1__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:522:1: ( ( ( rule__WorkSequence__LinkTypeAssignment_1 ) ) )
            // InternalPDL3.g:523:1: ( ( rule__WorkSequence__LinkTypeAssignment_1 ) )
            {
            // InternalPDL3.g:523:1: ( ( rule__WorkSequence__LinkTypeAssignment_1 ) )
            // InternalPDL3.g:524:2: ( rule__WorkSequence__LinkTypeAssignment_1 )
            {
             before(grammarAccess.getWorkSequenceAccess().getLinkTypeAssignment_1()); 
            // InternalPDL3.g:525:2: ( rule__WorkSequence__LinkTypeAssignment_1 )
            // InternalPDL3.g:525:3: rule__WorkSequence__LinkTypeAssignment_1
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
    // InternalPDL3.g:533:1: rule__WorkSequence__Group__2 : rule__WorkSequence__Group__2__Impl rule__WorkSequence__Group__3 ;
    public final void rule__WorkSequence__Group__2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:537:1: ( rule__WorkSequence__Group__2__Impl rule__WorkSequence__Group__3 )
            // InternalPDL3.g:538:2: rule__WorkSequence__Group__2__Impl rule__WorkSequence__Group__3
            {
            pushFollow(FOLLOW_7);
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
    // InternalPDL3.g:545:1: rule__WorkSequence__Group__2__Impl : ( ( rule__WorkSequence__SuccessorAssignment_2 ) ) ;
    public final void rule__WorkSequence__Group__2__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:549:1: ( ( ( rule__WorkSequence__SuccessorAssignment_2 ) ) )
            // InternalPDL3.g:550:1: ( ( rule__WorkSequence__SuccessorAssignment_2 ) )
            {
            // InternalPDL3.g:550:1: ( ( rule__WorkSequence__SuccessorAssignment_2 ) )
            // InternalPDL3.g:551:2: ( rule__WorkSequence__SuccessorAssignment_2 )
            {
             before(grammarAccess.getWorkSequenceAccess().getSuccessorAssignment_2()); 
            // InternalPDL3.g:552:2: ( rule__WorkSequence__SuccessorAssignment_2 )
            // InternalPDL3.g:552:3: rule__WorkSequence__SuccessorAssignment_2
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequence__SuccessorAssignment_2();

            state._fsp--;


            }

             after(grammarAccess.getWorkSequenceAccess().getSuccessorAssignment_2()); 

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
    // InternalPDL3.g:560:1: rule__WorkSequence__Group__3 : rule__WorkSequence__Group__3__Impl ;
    public final void rule__WorkSequence__Group__3() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:564:1: ( rule__WorkSequence__Group__3__Impl )
            // InternalPDL3.g:565:2: rule__WorkSequence__Group__3__Impl
            {
            pushFollow(FOLLOW_2);
            rule__WorkSequence__Group__3__Impl();

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
    // InternalPDL3.g:571:1: rule__WorkSequence__Group__3__Impl : ( '; ' ) ;
    public final void rule__WorkSequence__Group__3__Impl() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:575:1: ( ( '; ' ) )
            // InternalPDL3.g:576:1: ( '; ' )
            {
            // InternalPDL3.g:576:1: ( '; ' )
            // InternalPDL3.g:577:2: '; '
            {
             before(grammarAccess.getWorkSequenceAccess().getSemicolonSpaceKeyword_3()); 
            match(input,18,FOLLOW_2); 
             after(grammarAccess.getWorkSequenceAccess().getSemicolonSpaceKeyword_3()); 

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


    // $ANTLR start "rule__Process__NameAssignment_1"
    // InternalPDL3.g:587:1: rule__Process__NameAssignment_1 : ( RULE_ID ) ;
    public final void rule__Process__NameAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:591:1: ( ( RULE_ID ) )
            // InternalPDL3.g:592:2: ( RULE_ID )
            {
            // InternalPDL3.g:592:2: ( RULE_ID )
            // InternalPDL3.g:593:3: RULE_ID
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


    // $ANTLR start "rule__Process__ProcessElementsAssignment_2"
    // InternalPDL3.g:602:1: rule__Process__ProcessElementsAssignment_2 : ( ruleProcessElement ) ;
    public final void rule__Process__ProcessElementsAssignment_2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:606:1: ( ( ruleProcessElement ) )
            // InternalPDL3.g:607:2: ( ruleProcessElement )
            {
            // InternalPDL3.g:607:2: ( ruleProcessElement )
            // InternalPDL3.g:608:3: ruleProcessElement
            {
             before(grammarAccess.getProcessAccess().getProcessElementsProcessElementParserRuleCall_2_0()); 
            pushFollow(FOLLOW_2);
            ruleProcessElement();

            state._fsp--;

             after(grammarAccess.getProcessAccess().getProcessElementsProcessElementParserRuleCall_2_0()); 

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
    // $ANTLR end "rule__Process__ProcessElementsAssignment_2"


    // $ANTLR start "rule__ProcessElement__WorkDefinitionAssignment_0_1"
    // InternalPDL3.g:617:1: rule__ProcessElement__WorkDefinitionAssignment_0_1 : ( ruleWorkDefinition ) ;
    public final void rule__ProcessElement__WorkDefinitionAssignment_0_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:621:1: ( ( ruleWorkDefinition ) )
            // InternalPDL3.g:622:2: ( ruleWorkDefinition )
            {
            // InternalPDL3.g:622:2: ( ruleWorkDefinition )
            // InternalPDL3.g:623:3: ruleWorkDefinition
            {
             before(grammarAccess.getProcessElementAccess().getWorkDefinitionWorkDefinitionParserRuleCall_0_1_0()); 
            pushFollow(FOLLOW_2);
            ruleWorkDefinition();

            state._fsp--;

             after(grammarAccess.getProcessElementAccess().getWorkDefinitionWorkDefinitionParserRuleCall_0_1_0()); 

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
    // $ANTLR end "rule__ProcessElement__WorkDefinitionAssignment_0_1"


    // $ANTLR start "rule__ProcessElement__WorkSequenceAssignment_1_1"
    // InternalPDL3.g:632:1: rule__ProcessElement__WorkSequenceAssignment_1_1 : ( ruleWorkSequence ) ;
    public final void rule__ProcessElement__WorkSequenceAssignment_1_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:636:1: ( ( ruleWorkSequence ) )
            // InternalPDL3.g:637:2: ( ruleWorkSequence )
            {
            // InternalPDL3.g:637:2: ( ruleWorkSequence )
            // InternalPDL3.g:638:3: ruleWorkSequence
            {
             before(grammarAccess.getProcessElementAccess().getWorkSequenceWorkSequenceParserRuleCall_1_1_0()); 
            pushFollow(FOLLOW_2);
            ruleWorkSequence();

            state._fsp--;

             after(grammarAccess.getProcessElementAccess().getWorkSequenceWorkSequenceParserRuleCall_1_1_0()); 

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
    // $ANTLR end "rule__ProcessElement__WorkSequenceAssignment_1_1"


    // $ANTLR start "rule__WorkDefinition__NameAssignment_0"
    // InternalPDL3.g:647:1: rule__WorkDefinition__NameAssignment_0 : ( RULE_ID ) ;
    public final void rule__WorkDefinition__NameAssignment_0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:651:1: ( ( RULE_ID ) )
            // InternalPDL3.g:652:2: ( RULE_ID )
            {
            // InternalPDL3.g:652:2: ( RULE_ID )
            // InternalPDL3.g:653:3: RULE_ID
            {
             before(grammarAccess.getWorkDefinitionAccess().getNameIDTerminalRuleCall_0_0()); 
            match(input,RULE_ID,FOLLOW_2); 
             after(grammarAccess.getWorkDefinitionAccess().getNameIDTerminalRuleCall_0_0()); 

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
    // $ANTLR end "rule__WorkDefinition__NameAssignment_0"


    // $ANTLR start "rule__WorkSequence__PredecessorAssignment_0"
    // InternalPDL3.g:662:1: rule__WorkSequence__PredecessorAssignment_0 : ( ( RULE_ID ) ) ;
    public final void rule__WorkSequence__PredecessorAssignment_0() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:666:1: ( ( ( RULE_ID ) ) )
            // InternalPDL3.g:667:2: ( ( RULE_ID ) )
            {
            // InternalPDL3.g:667:2: ( ( RULE_ID ) )
            // InternalPDL3.g:668:3: ( RULE_ID )
            {
             before(grammarAccess.getWorkSequenceAccess().getPredecessorWorkDefinitionCrossReference_0_0()); 
            // InternalPDL3.g:669:3: ( RULE_ID )
            // InternalPDL3.g:670:4: RULE_ID
            {
             before(grammarAccess.getWorkSequenceAccess().getPredecessorWorkDefinitionIDTerminalRuleCall_0_0_1()); 
            match(input,RULE_ID,FOLLOW_2); 
             after(grammarAccess.getWorkSequenceAccess().getPredecessorWorkDefinitionIDTerminalRuleCall_0_0_1()); 

            }

             after(grammarAccess.getWorkSequenceAccess().getPredecessorWorkDefinitionCrossReference_0_0()); 

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
    // $ANTLR end "rule__WorkSequence__PredecessorAssignment_0"


    // $ANTLR start "rule__WorkSequence__LinkTypeAssignment_1"
    // InternalPDL3.g:681:1: rule__WorkSequence__LinkTypeAssignment_1 : ( ruleWorkSequenceType ) ;
    public final void rule__WorkSequence__LinkTypeAssignment_1() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:685:1: ( ( ruleWorkSequenceType ) )
            // InternalPDL3.g:686:2: ( ruleWorkSequenceType )
            {
            // InternalPDL3.g:686:2: ( ruleWorkSequenceType )
            // InternalPDL3.g:687:3: ruleWorkSequenceType
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


    // $ANTLR start "rule__WorkSequence__SuccessorAssignment_2"
    // InternalPDL3.g:696:1: rule__WorkSequence__SuccessorAssignment_2 : ( ( RULE_ID ) ) ;
    public final void rule__WorkSequence__SuccessorAssignment_2() throws RecognitionException {

        		int stackSize = keepStackSize();
        	
        try {
            // InternalPDL3.g:700:1: ( ( ( RULE_ID ) ) )
            // InternalPDL3.g:701:2: ( ( RULE_ID ) )
            {
            // InternalPDL3.g:701:2: ( ( RULE_ID ) )
            // InternalPDL3.g:702:3: ( RULE_ID )
            {
             before(grammarAccess.getWorkSequenceAccess().getSuccessorWorkDefinitionCrossReference_2_0()); 
            // InternalPDL3.g:703:3: ( RULE_ID )
            // InternalPDL3.g:704:4: RULE_ID
            {
             before(grammarAccess.getWorkSequenceAccess().getSuccessorWorkDefinitionIDTerminalRuleCall_2_0_1()); 
            match(input,RULE_ID,FOLLOW_2); 
             after(grammarAccess.getWorkSequenceAccess().getSuccessorWorkDefinitionIDTerminalRuleCall_2_0_1()); 

            }

             after(grammarAccess.getWorkSequenceAccess().getSuccessorWorkDefinitionCrossReference_2_0()); 

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
    // $ANTLR end "rule__WorkSequence__SuccessorAssignment_2"

    // Delegated rules


 

    public static final BitSet FOLLOW_1 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_2 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_3 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_4 = new BitSet(new long[]{0x0000000000030000L});
    public static final BitSet FOLLOW_5 = new BitSet(new long[]{0x0000000000030002L});
    public static final BitSet FOLLOW_6 = new BitSet(new long[]{0x0000000000000012L});
    public static final BitSet FOLLOW_7 = new BitSet(new long[]{0x0000000000040000L});
    public static final BitSet FOLLOW_8 = new BitSet(new long[]{0x0000000000007800L});

}