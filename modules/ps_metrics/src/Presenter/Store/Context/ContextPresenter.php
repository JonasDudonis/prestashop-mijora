<?php

/**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License version 3.0
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License version 3.0
 */

namespace PrestaShop\Module\Ps_metrics\Presenter\Store\Context;

use PrestaShop\Module\Ps_metrics\Adapter\LinkAdapter;
use PrestaShop\Module\Ps_metrics\Context\PrestaShopContext;
use PrestaShop\Module\Ps_metrics\Module\DashboardModules;
use PrestaShop\Module\Ps_metrics\Presenter\PresenterInterface;
use PrestaShop\Module\Ps_metrics\Provider\AnalyticsAccountsListProvider;
use PrestaShop\Module\Ps_metrics\Provider\ShopsProvider;
use PrestaShop\Module\Ps_metrics\Repository\ConfigurationRepository;
use PrestaShop\PsAccountsInstaller\Installer\Exception\InstallerException;
use PrestaShop\PsAccountsInstaller\Installer\Facade\PsAccounts;
use Ps_metrics;

class ContextPresenter implements PresenterInterface
{
    /**
     * @var Ps_metrics
     */
    private $module;

    /**
     * @var PrestaShopContext
     */
    private $context;

    /**
     * @var LinkAdapter
     */
    private $linkAdapter;

    /**
     * @var ConfigurationRepository
     */
    private $configurationRepository;

    /**
     * @var ShopsProvider
     */
    private $shopsProvider;

    /**
     * @var DashboardModules;
     */
    private $dashboardModules;

    /**
     * @var AnalyticsAccountsListProvider
     */
    private $analyticsAccountsListProvider;

    /**
     * @var PsAccounts
     */
    private $psAccountsFacade;

    public function __construct(
        Ps_metrics $module,
        PrestaShopContext $context,
        PsAccounts $psAccountsFacade,
        LinkAdapter $linkAdapter,
        ConfigurationRepository $configurationRepository,
        ShopsProvider $shopsProvider,
        DashboardModules $dashboardModules,
        AnalyticsAccountsListProvider $analyticsAccountsListProvider
    ) {
        $this->module = $module;
        $this->context = $context;
        $this->psAccountsFacade = $psAccountsFacade;
        $this->linkAdapter = $linkAdapter;
        $this->configurationRepository = $configurationRepository;
        $this->shopsProvider = $shopsProvider;
        $this->dashboardModules = $dashboardModules;
        $this->analyticsAccountsListProvider = $analyticsAccountsListProvider;
    }

    /**
     * Present the Context Vuex
     *
     * @return array
     */
    public function present()
    {
        $currentShop = $this->shopsProvider->getShopUrl($this->context->getShopId());
        try {
            $psAccountsService = $this->psAccountsFacade->getPsAccountsService();
            $shopUuidV4 = $psAccountsService->getShopUuidV4();
            $email = $psAccountsService->getEmail();
            $emailIsValidated = $psAccountsService->isEmailValidated();
            $accountsUrl = $psAccountsService->getAdminAjaxUrl();
        } catch (InstallerException $e) {
            $shopUuidV4 = '';
            $email = '';
            $emailIsValidated = false;
            $accountsUrl = '';
        }

        return [
            'context' => [
                'app' => $this->getCurrentVueApp(),
                'canShowDashboard' => !empty($email) && $emailIsValidated ? true : false,
                'user' => [
                    'email' => $email,
                    'emailIsValidated' => $emailIsValidated,
                    'isSuperAdmin' => \Context::getContext()->employee->isSuperAdmin(),
                    'gaIsOnboarded' => (bool) $this->configurationRepository->getGoogleLinkedValue(),
                ],
                'googleAccountsList' => $this->analyticsAccountsListProvider->getAccountsList(),
                'googleAccount' => $this->analyticsAccountsListProvider->getSelectedAccount(),
                'dashboardModulesState' => $this->dashboardModules->modulesIsEnabled(),
                'version_ps' => _PS_VERSION_,
                'version_module' => $this->module->version,
                'moduleName' => $this->module->name,
                'newVersionAvailable' => false,
                'isShop17' => version_compare(_PS_VERSION_, '1.7.3.0', '>='),
                'configurationLink' => $this->linkAdapter->getAdminLink($this->module->metricsSettingsController),
                'controllersLinks' => [
                    'accounts' => $accountsUrl,
                    'graphql' => $this->linkAdapter->getAdminLink($this->module->graphqlController),
                    'dashboardAjax' => $this->linkAdapter->getAdminLink($this->module->ajaxDashboardController),
                    'metrics' => $this->linkAdapter->getAdminLink($this->module->metricsStatsController),
                    'settingsAjax' => $this->linkAdapter->getAdminLink($this->module->ajaxSettingsController),
                    'settings' => $this->linkAdapter->getAdminLink($this->module->metricsSettingsController),
                    'faq' => $this->linkAdapter->getAdminLink($this->module->metricsSettingsController) . '#/help',
                ],
                'i18n' => [
                    'isoCode' => $this->context->getLanguageIsoCode(),
                    'languageLocale' => $this->context->getLanguageCode(),
                    'currencyIsoCode' => $this->context->getCurrencyIsoCode(),
                ],
                'shop' => [
                    'shopUuid' => $shopUuidV4,
                    'domain' => $currentShop['domain'],
                    'url' => $currentShop['url'],
                ],
                'readmeUrl' => $this->getReadme(),
                'productTourFreeDone' => \Configuration::get('PS_METRICS_PRODUCT_TOUR_FREE', 0),
                'productTourAdvancedDone' => \Configuration::get('PS_METRICS_PRODUCT_TOUR_ADVANCED', 0),
                'showOtherDashboardBlocks' => !$this->checkIfPageIsOldStats(),
            ],
        ];
    }

    /**
     * Get Vue App to use in terms of context Controller Name
     *
     * @return string
     */
    private function getCurrentVueApp()
    {
        switch ($this->context->getControllerName()) {
            case 'AdminMetricsStats':
                return 'metrics';
            case 'AdminMetricsSettings':
                return 'settings';
            case 'AdminDashboard':
            case 'AdminStats':
                return 'dashboard';
            default:
                return 'metrics';
        }
    }

    /**
     * Check if page is ols stats page
     *
     * @return bool
     */
    private function checkIfPageIsOldStats()
    {
        return $this->context->getControllerName() === 'AdminStats';
    }

    /**
     * Get the documentation url depending on the current language
     *
     * @return string path of the doc
     */
    private function getReadme()
    {
        $isoCode = $this->context->getLanguageIsoCode();

        if (!file_exists(_PS_ROOT_DIR_ . _MODULE_DIR_ . $this->module->name . '/docs/readme_' . $isoCode . '.pdf')) {
            $isoCode = 'en';
        }

        return _MODULE_DIR_ . $this->module->name . '/docs/readme_' . $isoCode . '.pdf';
    }
}
