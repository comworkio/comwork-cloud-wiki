const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
    title: 'Comwork cloud',
    tagline: 'The cloud that bring you the gitops power again',
    url: 'https://doc.cloud.comwork.io',
    baseUrl: '/',
    onBrokenLinks: 'throw',
    onBrokenMarkdownLinks: 'warn',
    favicon: 'img/favicon.ico',

    plugins:
        [[require.resolve('docusaurus-lunr-search'), {
            languages: ['en', 'fr']
        }],
        [require.resolve('@docusaurus/plugin-client-redirects'), {
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
                    from: '/docs/tutorials/fr',
                    to: '/docs/tutorials/translations/fr'
                },
                {
                    from: '/docs/fr',
                    to: '/docs/tutorials/translations/fr'
                },
                {
                    from: '/fr',
                    to: '/docs/tutorials/translations/fr'
                }
            ]
        }],
        require.resolve('docusaurus-plugin-matomo')
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
                    sidebarPath: require.resolve('./sidebars.js')
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
                    content: 'Comwork cloud documentation and tutorials'
                },
                {
                    name: 'keywords',
                    content: 'Comwork, cloud, vscode, git, ansible, portainer, wordpress, gitops, gitlab, code, kubernetes, docker'
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
                    content: 'Comwork cloud documentation and tutorials'
                },
                {
                    property: 'og:description',
                    content: 'Comwork cloud documentation and tutorials'
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
                    content: 'Comwork cloud documentation and tutorials'
                },
                {
                    property: 'twitter:title',
                    content: 'Comwork cloud documentation and tutorials'
                },
                {
                    property: 'og:type',
                    content: 'Comwork cloud documentation and tutorials'
                },
            ],
            navbar: {
                title: 'Comwork cloud',
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
                        to: 'https://join.slack.com/t/comwork-cloud/shared_invite/zt-1h04v2jp0-cF9p53MzfzxuChVobWKQEQ',
                        label: 'Slack',
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
                                label: 'Slack',
                                to: 'https://join.slack.com/t/comwork-cloud/shared_invite/zt-1h04v2jp0-cF9p53MzfzxuChVobWKQEQ',
                            },
                            {
                                to: 'https://discord.gg/CXskxxPauz',
                                label: 'Discord',
                                position: 'right',
                            },
                        ],
                    },
                ],
                copyright: `Copyright © ${new Date().getFullYear()} Comworkio SASU.`,
            },
            prism: {
                theme: lightCodeTheme,
                darkTheme: darkCodeTheme,
            },
        }),
};

module.exports = config;
