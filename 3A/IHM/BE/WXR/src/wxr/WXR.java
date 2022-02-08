/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

package wxr;

import java.awt.Color;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ncazes2
 */
public class WXR extends javax.swing.JFrame {
    // L'énumération des états possibles 
    private enum PossibleState {
        // Premier état : tous les boutons du panneau Mode sont accessibles, 
        // dans le panneau Tilt Angle, on peut appuyer sur Manual ou Auto (on est en Mode auto)
        E1(true, true, true, true, true, 
            false, true, false, false, false, false),
        // Deuxième état : tous les boutons du panneau Mode sont accessibles, 
        // dans le panneau Tilt Angle, les boutons Manual, Auto et ceux de la 
        // stabilisation sont accesibles
        E2(true, true, true, true, true, 
            false, true, false, true, false, false),
        // Troisième état : tous les boutons du panneau Mode sont accessibles, 
        // ainsi que ceux du panneau Tilt Angle
        E3(true, true, true, true, true, 
            false, false, true, false, true, true),
        // Quatrième état
        E4(true, true, true, true, true, 
            true, false, false, false, false, false);
        
        // pour le panneau Mode
        private final Boolean wxonButtonEnabled;        
        private final Boolean tstButtonEnabled;
        private final Boolean wxaButtonEnabled;
        private final Boolean offModeButtonEnabled;       
        private final Boolean stdbyButtonEnabled;
        // pour le panneau Tilt Angle
        private final Boolean autoButtonEnabled;
        private final Boolean manualButtonEnabled;
        private final Boolean onStabilizationButtonEnabled;
        private final Boolean offStabilizationButtonEnabled;
        private final Boolean newValueTiltAngleDisplayTextFieldEditable;
        private final Boolean okButtonEnabled;


        // Le constructeur est privé car il ne sera appelé qu'à l'intérieur de
        // l'énumération
        private PossibleState(final Boolean wxonButtonEnabled, 
                final Boolean tstButtonEnabled, 
                final Boolean wxaButtonEnabled, 
                final Boolean offModeButtonEnabled, 
                final Boolean stdbyButtonEnabled,
                final Boolean autoButtonEnabled,
                final Boolean manualButtonEnabled, 
                final Boolean onStabilizationButtonEnabled, 
                final Boolean offStabilizationButtonEnabled, 
                final Boolean newValueTiltAngleDisplayTextFieldEditable, 
                final Boolean okButtonEnabled) {

            // pour le panneau Mode
            this.wxonButtonEnabled = wxonButtonEnabled;
            this.tstButtonEnabled = tstButtonEnabled;
            this.wxaButtonEnabled = wxaButtonEnabled;
            this.offModeButtonEnabled = offModeButtonEnabled;            
            this.stdbyButtonEnabled = stdbyButtonEnabled;

            // pour le panneau Tilt Angle
            this.autoButtonEnabled = autoButtonEnabled;
            this.manualButtonEnabled = manualButtonEnabled;
            this.onStabilizationButtonEnabled = onStabilizationButtonEnabled;
            this.offStabilizationButtonEnabled = offStabilizationButtonEnabled;
            this.newValueTiltAngleDisplayTextFieldEditable = newValueTiltAngleDisplayTextFieldEditable;
            this.okButtonEnabled = okButtonEnabled;
        }

        public Boolean getWxonButtonEnabled() {
            return wxonButtonEnabled;
        }

        public Boolean getTstButtonEnabled() {
            return tstButtonEnabled;
        }

        public Boolean getWxaButtonEnabled() {
            return wxaButtonEnabled;
        }

        public Boolean getOffModeButtonEnabled() {
            return offModeButtonEnabled;
        }

        public Boolean getStdbyButtonEnabled() {
            return stdbyButtonEnabled;
        }

        public Boolean getAutoButtonEnabled() {
            return autoButtonEnabled;
        }

        public Boolean getManualButtonEnabled() {
            return manualButtonEnabled;
        }

        public Boolean getOnStabilizationButtonEnabled() {
            return onStabilizationButtonEnabled;
        }

        public Boolean getOffStabilizationButtonEnabled() {
            return offStabilizationButtonEnabled;
        }

        public Boolean getNewValueTiltAngleDisplayTextFieldEditable() {
            return newValueTiltAngleDisplayTextFieldEditable;
        }

        public Boolean getOkButtonEnabled() {
            return okButtonEnabled;
        }
    }

    // Etat courant 
    private PossibleState currentState;
    private List<javax.swing.JButton> modeButtons = new ArrayList<javax.swing.JButton>();
    private List<javax.swing.JButton> tiltAngleButtons = new ArrayList<javax.swing.JButton>();

    /** Creates new form WXR */
    public WXR() {
        initComponents();
        initModeButtons();
        initTiltAngleButtons(); 

        // Spécifier l'état initial
        goToState(PossibleState.E1);
    }

    public void goToState(PossibleState state) {
        // Nouvel état courant
        currentState = state;
        // Mise à jour de l'aspect graphique en fonction de la valeur des 
        // attributs liés au nouvel état courant
        wxonButton.setEnabled(state.wxonButtonEnabled);
        tstButton.setEnabled(state.tstButtonEnabled);
        offModeButton.setEnabled(state.offModeButtonEnabled);
        wxaButton.setEnabled(state.wxaButtonEnabled);
        stdbyButton.setEnabled(state.stdbyButtonEnabled);
        autoButton.setEnabled(state.autoButtonEnabled);
        manualButton.setEnabled(state.manualButtonEnabled);
        onStabilizationButton.setEnabled(state.onStabilizationButtonEnabled);
        offStabilizationButton.setEnabled(state.offStabilizationButtonEnabled);
        newValueTiltAngleDisplayTextField.setEnabled(state.newValueTiltAngleDisplayTextFieldEditable);
        okButton.setEnabled(state.okButtonEnabled);
    }

    public void colorOneModeButton(javax.swing.JButton button) {
        for (javax.swing.JButton modeButton : modeButtons) {
            modeButton.setBackground(Color.LIGHT_GRAY); 
        }
        button.setBackground(Color.GREEN);
    }
    
    public void colorAutoOrManualButton(javax.swing.JButton button) {
        autoButton.setBackground(Color.LIGHT_GRAY);
        manualButton.setBackground(Color.LIGHT_GRAY);
        // Pour éviter que ces derniers restent enclenchés après un changement d'état
        onStabilizationButton.setBackground(Color.LIGHT_GRAY);
        offStabilizationButton.setBackground(Color.LIGHT_GRAY);
        
        button.setBackground(Color.GREEN);
    }
    
    public void colorOnOrOffStabilizationButton(javax.swing.JButton button) {
        onStabilizationButton.setBackground(Color.LIGHT_GRAY);
        offStabilizationButton.setBackground(Color.LIGHT_GRAY);
        
        button.setBackground(Color.GREEN);
    }

    public void initModeButtons() {
        // Remplir la liste des boutons du panneau Mode
        modeButtons.add(wxaButton); 
        modeButtons.add(wxonButton);
        modeButtons.add(tstButton);
        modeButtons.add(offModeButton);
        modeButtons.add(stdbyButton);
    }
    
    public void initTiltAngleButtons() {
        // Remplir la liste des boutons du panneau Tilt Angle
        tiltAngleButtons.add(autoButton); 
        tiltAngleButtons.add(manualButton);               
        tiltAngleButtons.add(onStabilizationButton);
        tiltAngleButtons.add(offStabilizationButton);
        tiltAngleButtons.add(okButton);
        
        // Mettre leur opacité à true pour pouvoir voir s'ils étaient enclenchés 
        // ou non avant d'être disabled
        for (javax.swing.JButton tiltAngleButton : tiltAngleButtons) {
            tiltAngleButton.setOpaque(true); 
        }
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTabbedPane1 = new javax.swing.JTabbedPane();
        modePanel = new javax.swing.JPanel();
        wxonButton = new javax.swing.JButton();
        tstButton = new javax.swing.JButton();
        wxaButton = new javax.swing.JButton();
        offModeButton = new javax.swing.JButton();
        stdbyButton = new javax.swing.JButton();
        tiltAnglePanel = new javax.swing.JPanel();
        tiltAngleModeTextField = new javax.swing.JTextField();
        autoButton = new javax.swing.JButton();
        manualButton = new javax.swing.JButton();
        stabilizationTextField = new javax.swing.JTextField();
        onStabilizationButton = new javax.swing.JButton();
        offStabilizationButton = new javax.swing.JButton();
        editTiltAngleTextField = new javax.swing.JTextField();
        currentValueTiltAngleTextField = new javax.swing.JTextField();
        newValueTiltAngleTextField = new javax.swing.JTextField();
        currentValueTiltAngleDisplayTextField = new javax.swing.JTextField();
        newValueTiltAngleDisplayTextField = new javax.swing.JTextField();
        okButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        wxonButton.setText("WXON");
        wxonButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                wxonButtonActionPerformed(evt);
            }
        });

        tstButton.setText("TST");
        tstButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                tstButtonActionPerformed(evt);
            }
        });

        wxaButton.setText("WXA");
        wxaButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                wxaButtonActionPerformed(evt);
            }
        });

        offModeButton.setText("OFF");
        offModeButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                offModeButtonActionPerformed(evt);
            }
        });

        stdbyButton.setText("STDBY");
        stdbyButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                stdbyButtonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout modePanelLayout = new javax.swing.GroupLayout(modePanel);
        modePanel.setLayout(modePanelLayout);
        modePanelLayout.setHorizontalGroup(
            modePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(modePanelLayout.createSequentialGroup()
                .addGroup(modePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(modePanelLayout.createSequentialGroup()
                        .addGap(46, 46, 46)
                        .addComponent(wxonButton)
                        .addGap(39, 39, 39)
                        .addComponent(tstButton)
                        .addGap(35, 35, 35)
                        .addComponent(wxaButton))
                    .addGroup(modePanelLayout.createSequentialGroup()
                        .addGap(107, 107, 107)
                        .addComponent(offModeButton)
                        .addGap(43, 43, 43)
                        .addComponent(stdbyButton)))
                .addContainerGap(72, Short.MAX_VALUE))
        );
        modePanelLayout.setVerticalGroup(
            modePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(modePanelLayout.createSequentialGroup()
                .addGap(55, 55, 55)
                .addGroup(modePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(wxonButton)
                    .addComponent(tstButton)
                    .addComponent(wxaButton))
                .addGap(36, 36, 36)
                .addGroup(modePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(offModeButton)
                    .addComponent(stdbyButton))
                .addContainerGap(132, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("MODE", modePanel);

        tiltAngleModeTextField.setEditable(false);
        tiltAngleModeTextField.setText("Tilt Angle Mode:");

        autoButton.setText("AUTO");
        autoButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                autoButtonActionPerformed(evt);
            }
        });

        manualButton.setText("MANUAL");
        manualButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                manualButtonActionPerformed(evt);
            }
        });

        stabilizationTextField.setEditable(false);
        stabilizationTextField.setText("Stabilization:");

        onStabilizationButton.setText("ON");
        onStabilizationButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                onStabilizationButtonActionPerformed(evt);
            }
        });

        offStabilizationButton.setText("OFF");
        offStabilizationButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                offStabilizationButtonActionPerformed(evt);
            }
        });

        editTiltAngleTextField.setEditable(false);
        editTiltAngleTextField.setText("Edit Tilt Angle:");

        currentValueTiltAngleTextField.setEditable(false);
        currentValueTiltAngleTextField.setText("The current value:");

        newValueTiltAngleTextField.setEditable(false);
        newValueTiltAngleTextField.setText("Enter the new value:");

        currentValueTiltAngleDisplayTextField.setEditable(false);
        currentValueTiltAngleDisplayTextField.setText("15");

        newValueTiltAngleDisplayTextField.setText("XX");

        okButton.setText("OK");
        okButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                okButtonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout tiltAnglePanelLayout = new javax.swing.GroupLayout(tiltAnglePanel);
        tiltAnglePanel.setLayout(tiltAnglePanelLayout);
        tiltAnglePanelLayout.setHorizontalGroup(
            tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(tiltAnglePanelLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(tiltAnglePanelLayout.createSequentialGroup()
                        .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(tiltAngleModeTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(stabilizationTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(tiltAnglePanelLayout.createSequentialGroup()
                                .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(autoButton)
                                    .addComponent(onStabilizationButton))
                                .addGap(37, 37, 37)
                                .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(manualButton)
                                    .addComponent(offStabilizationButton))))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(tiltAnglePanelLayout.createSequentialGroup()
                        .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(editTiltAngleTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(tiltAnglePanelLayout.createSequentialGroup()
                                .addGap(12, 12, 12)
                                .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(newValueTiltAngleTextField)
                                    .addComponent(currentValueTiltAngleTextField))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(currentValueTiltAngleDisplayTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGroup(tiltAnglePanelLayout.createSequentialGroup()
                                        .addComponent(newValueTiltAngleDisplayTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                        .addComponent(okButton)))))
                        .addGap(0, 142, Short.MAX_VALUE))))
        );
        tiltAnglePanelLayout.setVerticalGroup(
            tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(tiltAnglePanelLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(tiltAngleModeTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(autoButton)
                    .addComponent(manualButton))
                .addGap(18, 18, 18)
                .addComponent(stabilizationTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(onStabilizationButton)
                    .addComponent(offStabilizationButton))
                .addGap(18, 18, 18)
                .addComponent(editTiltAngleTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(currentValueTiltAngleTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(currentValueTiltAngleDisplayTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(tiltAnglePanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(newValueTiltAngleTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(newValueTiltAngleDisplayTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(okButton))
                .addContainerGap(20, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("TILT ANGLE", tiltAnglePanel);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jTabbedPane1)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void wxonButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_wxonButtonActionPerformed
        switch(currentState) {
            case E1:
                // On reste dans le même état
            case E2:
                // On reste dans le même état
            case E3:
                // On reste dans le même état
            case E4:
                // On reste dans le même état
                colorOneModeButton(wxonButton);
                break; 
            default: 
                throw new IllegalStateException(); 
        }
    }//GEN-LAST:event_wxonButtonActionPerformed

    private void tstButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_tstButtonActionPerformed
        switch(currentState) {
            case E1:
                // On reste dans le même état
            case E2:
                // On reste dans le même état
            case E3:
                // On reste dans le même état
            case E4:
                // On reste dans le même état
                colorOneModeButton(tstButton);
                break;
            default: 
                throw new IllegalStateException(); 
        }
    }//GEN-LAST:event_tstButtonActionPerformed

    private void wxaButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_wxaButtonActionPerformed
       switch(currentState) {
            case E1:
                // On reste dans le même état
            case E2:
                // On reste dans le même état
            case E3:
                // On reste dans le même état
            case E4:
                // On reste dans le même état
                colorOneModeButton(wxaButton);
                break;
            default: 
                throw new IllegalStateException();
        }
    }//GEN-LAST:event_wxaButtonActionPerformed

    private void offModeButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_offModeButtonActionPerformed
       switch(currentState) {
            case E1:
                // On reste dans le même état
            case E2:
                // On reste dans le même état
            case E3:
                // On reste dans le même état
            case E4:
                // On reste dans le même état
                colorOneModeButton(offModeButton);
                break;
            default: 
                throw new IllegalStateException(); 
        }
    }//GEN-LAST:event_offModeButtonActionPerformed

    private void stdbyButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_stdbyButtonActionPerformed
       switch(currentState) {
            case E1:
                // On reste dans le même état
            case E2:
                // On reste dans le même état
            case E3:
                // On reste dans le même état
            case E4:
                // On reste dans le même état
                colorOneModeButton(stdbyButton);
                break;
            default: 
                throw new IllegalStateException();
        }
    }//GEN-LAST:event_stdbyButtonActionPerformed

    private void autoButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_autoButtonActionPerformed
       switch(currentState) {
            case E1:
                throw new IllegalStateException(); 
            case E2:
                throw new IllegalStateException();
            case E3:
                throw new IllegalStateException();
            case E4:
                goToState(PossibleState.E1);
                colorAutoOrManualButton(autoButton); 
                break; 
            default: 
                throw new IllegalStateException(); 
        }
    }//GEN-LAST:event_autoButtonActionPerformed

    private void manualButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_manualButtonActionPerformed
       switch(currentState) {
            case E1:
                colorAutoOrManualButton(manualButton);
                goToState(PossibleState.E2);
                break; 
            case E2:
                // On reste dans le même état
                colorAutoOrManualButton(manualButton);
                break;
            case E3:
                throw new IllegalStateException();
            case E4:
                throw new IllegalStateException();
            default: 
                throw new IllegalStateException(); 
        }
    }//GEN-LAST:event_manualButtonActionPerformed

    private void onStabilizationButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_onStabilizationButtonActionPerformed
       switch(currentState) {
            case E1:
                throw new IllegalStateException();
            case E2:
                throw new IllegalStateException(); 
            case E3:
                colorOnOrOffStabilizationButton(onStabilizationButton);
                goToState(PossibleState.E4);
                break; 
            case E4:
                throw new IllegalStateException();
            default: 
                throw new IllegalStateException(); 
        }
    }//GEN-LAST:event_onStabilizationButtonActionPerformed

    private void offStabilizationButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_offStabilizationButtonActionPerformed
       switch(currentState) {
            case E1:
                throw new IllegalStateException();
            case E2:
                colorOnOrOffStabilizationButton(offStabilizationButton);
                goToState(PossibleState.E3);
                break; 
            case E3:
                throw new IllegalStateException();
            case E4:
                throw new IllegalStateException();
            default: 
                throw new IllegalStateException(); 
        }
    }//GEN-LAST:event_offStabilizationButtonActionPerformed

    private void okButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_okButtonActionPerformed
       switch(currentState) {
            case E1:
                throw new IllegalStateException();
            case E2:
                throw new IllegalStateException(); 
            case E3:
                // Récupérer la valeur saisie
                String newValueTiltAngle = newValueTiltAngleDisplayTextField.getText();
                // L'afficher
                currentValueTiltAngleDisplayTextField.setText(newValueTiltAngle); 
                
                goToState(PossibleState.E4);
                break;
            case E4:
                throw new IllegalStateException();
            default: 
                throw new IllegalStateException();
        }   
    }//GEN-LAST:event_okButtonActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(WXR.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(WXR.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(WXR.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(WXR.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new WXR().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton autoButton;
    private javax.swing.JTextField currentValueTiltAngleDisplayTextField;
    private javax.swing.JTextField currentValueTiltAngleTextField;
    private javax.swing.JTextField editTiltAngleTextField;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JButton manualButton;
    private javax.swing.JPanel modePanel;
    private javax.swing.JTextField newValueTiltAngleDisplayTextField;
    private javax.swing.JTextField newValueTiltAngleTextField;
    private javax.swing.JButton offModeButton;
    private javax.swing.JButton offStabilizationButton;
    private javax.swing.JButton okButton;
    private javax.swing.JButton onStabilizationButton;
    private javax.swing.JTextField stabilizationTextField;
    private javax.swing.JButton stdbyButton;
    private javax.swing.JTextField tiltAngleModeTextField;
    private javax.swing.JPanel tiltAnglePanel;
    private javax.swing.JButton tstButton;
    private javax.swing.JButton wxaButton;
    private javax.swing.JButton wxonButton;
    // End of variables declaration//GEN-END:variables

}
