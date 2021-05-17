<?php
class Inbankloancalculator extends Module
{
    public function __construct()
    {
        $this->name = 'inbankloancalculator';
        $this->author = 'Jonas Dudonis';
        $this->version = '1.0.0';
        $this->bootstrap = true;
        parent::__construct();
        $this->displayName = $this->l('Inbank Loan Calculator');
        $this->description = $this->l('This is a plugin for displaying InBank Loan Calculator below your product');
        $this->ps_versions_compliancy = array('min' => '1.7.0.0', 'max' => '1.7.7.4');
    }
    public function install ()
    {
        return parent::install() && $this->registerHook('displayProductAdditionalInfo');
    }
    public function uninstall()
    {
        return parent::uninstall();
    }
    public function hookDisplayProductAdditionalInfo ()
    {
        return $this->display(__FILE__, 'views/templates/hook/home.tpl');
    }
    public function getContent ()
    {
        return $this->display(__FILE__, 'views/templates/admin/configure.tpl');
    } 
}