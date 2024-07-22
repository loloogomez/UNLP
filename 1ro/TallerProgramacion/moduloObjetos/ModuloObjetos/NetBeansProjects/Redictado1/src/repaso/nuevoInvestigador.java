/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

import javax.swing.JOptionPane;

/**
 *
 * @author low
 */
public class nuevoInvestigador extends javax.swing.JFrame {

    /**
     * Creates new form nuevoInvestigador
     */
    public nuevoInvestigador() {
        initComponents();
    }
    
    private String nombre;
    private int categoria;
    private String especialidad;
    private boolean listo = false;

    public String getNombre() {
        return nombre;
    }

    public boolean getListo(){
        return listo;
    }
    
    public void setListo(boolean unListo){
        listo = unListo;
    }
    
    public int getCategoria() {
        return categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }
    
    public void guardarInvestigador(){
        if (!txtNombreDelInvestigador.getText().equals("ingrese el nombre"))
            nombre = txtNombreDelInvestigador.getText();
        if (!spnCategoriaDelInvestigador.getValue().equals(0))
            categoria = (int)spnCategoriaDelInvestigador.getValue();
        if (!txtEspecialidadDelInvestigador.getText().equals("ingrese la especialidad"))
            especialidad = txtEspecialidadDelInvestigador.getText();
    }
    
    public void reiniciarInvestigador(){
        txtNombreDelInvestigador.setText("ingrese el nombre");
        nombre = "";
        spnCategoriaDelInvestigador.setValue(0);
        categoria = 0;
        txtEspecialidadDelInvestigador.setText("ingrese la especialidad");
        especialidad = "";
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        lblNombreDelInvestigador = new javax.swing.JLabel();
        txtNombreDelInvestigador = new javax.swing.JTextField();
        lblCategoriaDelInvestigador = new javax.swing.JLabel();
        lblEspecialidadDelInvestigador = new javax.swing.JLabel();
        spnCategoriaDelInvestigador = new javax.swing.JSpinner();
        lblNuevoInvestigador = new javax.swing.JLabel();
        btnGuardar = new javax.swing.JButton();
        btnLimpiar = new javax.swing.JButton();
        txtEspecialidadDelInvestigador = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        lblNombreDelInvestigador.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        lblNombreDelInvestigador.setText("Nombre del investigador:");

        txtNombreDelInvestigador.setText("ingrese el nombre");
        txtNombreDelInvestigador.setCursor(new java.awt.Cursor(java.awt.Cursor.TEXT_CURSOR));

        lblCategoriaDelInvestigador.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        lblCategoriaDelInvestigador.setText("categoria del invesitgador:");

        lblEspecialidadDelInvestigador.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N
        lblEspecialidadDelInvestigador.setText("Especialidad de investigador: ");

        spnCategoriaDelInvestigador.setFont(new java.awt.Font("Tahoma", 0, 18)); // NOI18N

        lblNuevoInvestigador.setFont(new java.awt.Font("Tahoma", 0, 36)); // NOI18N
        lblNuevoInvestigador.setText("Nuevo Investigador");

        btnGuardar.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        btnGuardar.setText("Guardar");
        btnGuardar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarActionPerformed(evt);
            }
        });

        btnLimpiar.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        btnLimpiar.setText("Limpiar");
        btnLimpiar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnLimpiarActionPerformed(evt);
            }
        });

        txtEspecialidadDelInvestigador.setText("ingrese la especialidad");
        txtEspecialidadDelInvestigador.setCursor(new java.awt.Cursor(java.awt.Cursor.TEXT_CURSOR));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(lblNuevoInvestigador)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(btnLimpiar, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnGuardar, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(31, 31, 31)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lblNombreDelInvestigador)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                .addComponent(lblCategoriaDelInvestigador, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(lblEspecialidadDelInvestigador, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtEspecialidadDelInvestigador, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(spnCategoriaDelInvestigador, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtNombreDelInvestigador, javax.swing.GroupLayout.PREFERRED_SIZE, 180, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(0, 3, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addComponent(lblNuevoInvestigador, javax.swing.GroupLayout.PREFERRED_SIZE, 42, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtNombreDelInvestigador, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblNombreDelInvestigador, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(52, 52, 52)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblCategoriaDelInvestigador)
                    .addComponent(spnCategoriaDelInvestigador, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(52, 52, 52)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtEspecialidadDelInvestigador, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblEspecialidadDelInvestigador, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnGuardar, javax.swing.GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE)
                    .addComponent(btnLimpiar, javax.swing.GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnGuardarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarActionPerformed
        // TODO add your handling code here:
        this.guardarInvestigador();
        JOptionPane.showMessageDialog(this,"nombre del Investigador: "+ nombre+
            " categoria del investigador: "+ categoria+
            " especialidad del investigador: "+ especialidad);
        if (getNombre().equals("") || getCategoria() == 0 || getEspecialidad().equals(""))
            this.setVisible(true);
        else{
            this.setVisible(false);
            setListo(true);
        }
    }//GEN-LAST:event_btnGuardarActionPerformed

    private void btnLimpiarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnLimpiarActionPerformed
        // TODO add your handling code here:
        this.reiniciarInvestigador();
    }//GEN-LAST:event_btnLimpiarActionPerformed

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
            java.util.logging.Logger.getLogger(nuevoInvestigador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(nuevoInvestigador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(nuevoInvestigador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(nuevoInvestigador.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new nuevoInvestigador().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnGuardar;
    private javax.swing.JButton btnLimpiar;
    private javax.swing.JLabel lblCategoriaDelInvestigador;
    private javax.swing.JLabel lblEspecialidadDelInvestigador;
    private javax.swing.JLabel lblNombreDelInvestigador;
    private javax.swing.JLabel lblNuevoInvestigador;
    private javax.swing.JSpinner spnCategoriaDelInvestigador;
    private javax.swing.JTextField txtEspecialidadDelInvestigador;
    private javax.swing.JTextField txtNombreDelInvestigador;
    // End of variables declaration//GEN-END:variables
}
