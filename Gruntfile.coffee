module.exports = (grunt) ->
  grunt.initConfig
    # bowerでinstallしたjsのconcat
    bower_concat:
      all:
        dest: './build/js/vendor.js'
        include: [
          # concatしたいファイル（何も書かないと全部）
        ]
        exclude: [
          # concatしたくないファイル
        ]
        dependencies:
          # ライブラリの依存関係
          # example
          'backbone': ['jquery', 'underscore']
        bowerOptions:
          relative: false

    connect:
      app:
        options:
          port: 2000
          base: "build/"
          open: "http://localhost:2000"

    compass:
      dist:
        options:
          sassDir: "src/stylesheets"
          cssDir: "build/css"
          specify: "src/stylesheets/**/*.scss"
          bundleExec: true
          environment: "development"

    csscomb:
      dist:
        files:
          "src/stylesheets/app.scss": ["src/stylesheets/app.scss"]

    csslint:
      dist:
        options:
          csslintrc: '.csslintrc'
        src: ['build/css/app.css']

    csso:
      dist:
        files:
          # uncss したファイル
          "build/css/hoge.min.css": ["build/css/hoge.css"]

    # 自分で書いたjsのconcat
    concat:
      'build/js/app.js': [
        # ここに書いていく
        'src/javascripts/hogehoge.js',
        'src/javascripts/piyopiyo.js'
      ]

    uglify:
      target:
        files:
          'build/js/app.min.js': ['build/js/app.js']
      vendor:
        files:
          'build/js/vendor.min.js': ['build/js/vendor.js']

    # そのページで使うルールセットだけ抽出してくれるやつ
    uncss:
      dist:
        files:
          # ここに書いていく
          'build/css/hoge.css': ['hoge.php']
          'build/css/piyo.css': ['piyo.php']

    watch:
      options:
        livereload: true

      stylesheets:
        files: ["src/stylesheets/**/*.scss"]
        tasks: ["stylesheet"]

      javascript:
        files: ["src/javascripts/**/*.js"]
        tasks: [""]

  grunt.loadNpmTasks "grunt-bower-concat"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-csslint"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-csscomb"
  grunt.loadNpmTasks "grunt-csso"
  grunt.loadNpmTasks "grunt-uncss"

  grunt.registerTask "default", ["develop"]
  grunt.registerTask "develop", [
    "bower_concat"
    "uglify:vendor"
    "stylesheet"
    "connect:app"
    "watch"
  ]
  grunt.registerTask "stylesheet", [
    "compass"
    "csscomb"
  ]
  grunt.registerTask "build", [
    "stylesheet"
    "uncss"
    "csso"
    "concat"
    "bower_concat"
    "uglify"
  ]
