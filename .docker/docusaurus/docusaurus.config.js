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
      }
      ],
      navbar: {
        title: 'Comwork cloud',
        logo: {
          alt: 'Comwork logo',
          src: 'img/comwork_logo.png',
        },
        items: [
          {
            type: 'doc',
            docId: 'README',
            position: 'left',
            label: 'Documentation',
          },
          {
            to: 'https://gitlab.comwork.io/comwork_public/comwork_cloud',
            label: 'Gitlab',
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
                label: 'Cloud console',
                to: 'https://cloud.comwork.io',
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
