module.exports = (grunt) ->
  grunt.initConfig
    # jsライブラリのconcat
    bower_concat:
      all:
        dest: './build/js/vendor.js'
        include: [
          # concatしたいファイル
        ]
        exclude: [
          # concatしたくないファイル
        ]
        dependencies:
          # 依存しているライブラリの関係を書く
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
          specify: "src/stylesheets/*.scss"
          bundleExec: true
          environment: "development"

    csscomb:
      dist:
        files:
          "src/stylesheets/*.scss": ["src/stylesheets/*.scss"]

    csslint:
      dist:
        options:
          csslintrc: '.csslintrc'
        src: ['build/css/app.css']

    csso:
      dist:
        files:
          "build/css/app.min.css": ["build/css/app.css"]

    # ライブラリ以外のjsファイルのconcat
    concat:
      'build/js/app.js': [
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

    watch:
      options:
        livereload: true

      stylesheets:
        files: ["src/stylesheets/*.scss"]
        tasks: ["stylesheet"]

      javascript:
        files: ["src/javascripts/*.js"]
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

  grunt.registerTask "default", ["develop"]
  grunt.registerTask "develop", [
    "bower_concat"
    "uglify:vendor"
    "connect:app"
    "watch"
  ]
  grunt.registerTask "stylesheet", [
    "compass"
    "csscomb"
    "csslint"
  ]
  grunt.registerTask "build", [
    "stylesheet"
    "csso"
    "concat"
    "bower_concat"
    "uglify"
  ]
