const config = {
    title: 'CWCloud',
    tagline: 'The cloud that bring you the gitops power again',
    url: 'https://doc.cloud.comwork.io',
    baseUrl: '/',
    onBrokenLinks: 'throw',
    onBrokenMarkdownLinks: 'warn',
    favicon: 'img/favicon.ico',

    plugins: [
        [
            '@easyops-cn/docusaurus-search-local',
            {
                hashed: true,
                language: ["en", "fr"],
                docsRouteBasePath: "/docs",
                indexDocs: true,
                indexPages: false,
                highlightSearchTermsOnTargetPage: true,
                removeDefaultStopWordFilter: true,
                removeDefaultStemmer: true,
            },
        ],
        [
            '@docusaurus/plugin-client-redirects',
            {
                redirects: [
                    {
                        from: '/docs/tutorials/api/cli',
                        to: '/docs/tutorials/cli/'
                    },
                    {
                        from: '/docs/tutorials/web_console',
                        to: '/docs/tutorials/console'
                    },
                    {
                        from: '/docs/onprem',
                        to: '/docs/selfhosted'
                    },
                    {
                        from: '/docs/tutorials/onprem',
                        to: '/docs/tutorials/selfhosted'
                    },
                    {
                        from: '/docs/tutorials/translations/fr/onprem',
                        to: '/docs/translations/fr/tutorials/selfhosted'
                    },
                    {
                    from: '/docs/tutorials/quickwit',
                    to: '/docs/tutorials/observability/quickwit'
                },
                {
                    from: '/docs/tutorials/translations/fr/quickwit',
                    to: '/docs/translations/fr/tutorials/observability/quickwit'
                },
                {
                    from: '/docs/tutorials/imalive',
                    to: '/docs/tutorials/observability/imalive'
                },
                {
                    from: '/docs/tutorials/translations/fr/imalive',
                    to: '/docs/translations/fr/tutorials/observability/imalive'
                },
                {
                        from: '/docs/tutorials/translations/fr/console/public/billing',
                        to: '/docs/translations/fr/tutorials/console/public/billing'
                    },
                    {
                        from: '/docs/tutorials/fr',
                        to: '/docs/translations/fr/tutorials'
                    },
                    {
                        from: '/docs/fr',
                        to: '/docs/translations/fr'
                    },
                    {
                        from: '/fr',
                        to: '/docs/translations/fr'
                    }
                ]
            }
        ],
        'docusaurus-plugin-matomo'
    ],
        
    i18n: {
        defaultLocale: 'en',
        locales: ['en'],
    },

    presets: [
        [
            'classic',
            /** @type {import('@docusaurus/preset-classic').Options} */
            ({
                docs: {
                    sidebarPath: require.resolve('./sidebars.js'),
                    exclude: ['**/price_calculator/**'],
                },
                blog: {
                    showReadingTime: true
                },
                theme: {
                    customCss: require.resolve('./src/css/custom.css'),
                },
            }),
        ],
    ],

    themeConfig:
        /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
        ({
            matomo: {
                matomoUrl: 'https://matomo.comwork.io/',
                siteId: '20',
                phpLoader: 'matomo.php',
                jsLoader: 'matomo.js',
            },
            metadata: [
                {
                    name: 'description',
                    content: 'CWCloud documentation and tutorials'
                },
                {
                    name: 'keywords',
                    content: 'Comwork, CwCloud, cloud, vscode, git, ansible, portainer, wordpress, gitops, gitlab, code, kubernetes, docker'
                },
                {
                    property: 'og:image',
                    content: 'img/comwork_logo.png'
                },
                {
                    property: 'og:image:width',
                    content: '300'
                },
                {
                    property: 'og:image:height',
                    content: '300'
                },
                {
                    property: 'og:site_name',
                    content: 'CWCloud documentation and tutorials'
                },
                {
                    property: 'og:description',
                    content: 'CWCloud documentation and tutorials'
                },
                {
                    property: 'og:url',
                    content: 'https://docs.cloud.comwork.io'
                },
                {
                    property: 'twitter:card',
                    content: 'canonical'
                },
                {
                    property: 'twitter:description',
                    content: 'CWCloud documentation and tutorials'
                },
                {
                    property: 'twitter:title',
                    content: 'CWCloud documentation and tutorials'
                },
                {
                    property: 'og:type',
                    content: 'CWCloud documentation and tutorials'
                },
            ],
            navbar: {
                title: 'CWCloud',
                logo: {
                    alt: 'Comwork logo',
                    src: 'img/comwork_logo.png',
                },
                items: [
                    {
                        to: 'https://cloud.comwork.io',
                        label: 'Console',
                        position: 'left',
                    },
                    {
                        to: 'https://cloud-api.comwork.io',
                        label: 'Api',
                        position: 'left',
                    },
                    {
                        to: 'https://status.comwork.io',
                        label: 'Status',
                        position: 'left',
                    },
                    {
                        to: 'https://youtube.com/playlist?list=PLVa_2sL_l0msxUnmaSpLAGlwOxizXWjht',
                        label: 'YouTube',
                        position: 'right',
                    },
                    {
                        to: 'https://gitlab.comwork.io/comwork_public/comwork_cloud',
                        label: 'Gitlab',
                        position: 'right',
                    },
                    {
                        to: 'https://discord.gg/CXskxxPauz',
                        label: 'Discord',
                        position: 'right',
                    },
                ],
            },
            footer: {
                style: 'dark',
                links: [
                    {
                        title: 'Comwork',
                        items: [
                            {
                                label: 'Home',
                                to: 'https://www.comwork.io',
                            },
                            {
                                label: 'Terms of services',
                                to: 'https://doc.comwork.cloud/docs/terms',
                            },
                            {
                                to: 'https://discord.gg/CXskxxPauz',
                                label: 'Discord',
                                position: 'right',
                            },
                            {
                                html: `<img src="https://cloud-api.comwork.io/v1/tracker/img/doc.cloud.comwork.io" style="display: none"></img>`
                            },
                        ],
                    },
                ],
                copyright: `Copyright © ${new Date().getFullYear()} Comworkio SASU.`,
            },
            prism: {
                theme: require('prism-react-renderer').themes.github,
                darkTheme: require('prism-react-renderer').themes.dracula,
            },
        }),
};

module.exports = config;
