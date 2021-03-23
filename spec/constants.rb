# frozen_string_literal: true

# rubocop:disable Layout/LineLength
IMG = '//div[@class="news-header__preview"]/div[@class="news-header__image"]/@style'
ONLINER = 'https://www.onliner.by/'
XPATH_MAIN_TABLE = '//div[@class="g-middle-i"]/div/div/div/div/a[@class="b-tile-main"]/@href'
XPATH_MAIN_TABLE_SECOND = '//div[@class="b-tiles cfix "]/div/div/div/a[@class="b-tile-main"]/@href'
XPATH_LINK_TEASER = '//div[@class="b-main-page-grid-4 b-main-page-news-2"]/ul/li/a[@class="b-teasers-2__teaser-i"]/@href'
XPATH_LINK_CATALOG = '//div[@class="b-catalog-layer"]/div/div/div/div/a[@class="b-tile-main"]/@href'
XPATH_LINK_PEOPLE = '//div[@class="b-main-page-grid-4-i sep-lines-type-1 cfix"]/div/section/figure/a/@href'
XPATH_LINK_AUTO = '//div[@class="b-main-page-grid-4__col b-main-page-grid-4__col-1x1 news-2__secondary-news-col"]/section/article/figure/a/@href'
XPATH_LINK_TECH = '//div[@class="b-main-page-grid-4__col b-main-page-grid-4__col-1x2 news-2__news-list-col"]/ul/li/figure/a/@href'
TITLE = '//div[@class="news-header__title"]/h1'
TEXT = '//div[@class="news-text"]/p'
TEXT_REGULAR = /[^\s.,!?0-9А-Яа-я]/
IMG_REGULAR = /\w+-\w+:\s\w+/
