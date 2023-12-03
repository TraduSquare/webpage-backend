# frozen_string_literal: true

require 'hanami/boot'
require 'jay_doubleu_tee'

use JayDoubleuTee::Authorization
run Hanami.app
