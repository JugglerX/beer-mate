module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch: {
      css: {
        files: [
          '**/*.less'
        ],
        tasks: ['less'],
        options: {
          livereload: true,
        },
      },
      erbfiles: {
        files: [
          '**/*.erb'
        ],
        options: {
          livereload: true,
        }
      }
    },
    less: {
      development: {
        options: {
          paths: ['public/css']
        },
        files: {
          'public/css/style.css': 'public/css/style.less'
        }
      }
    },
  });

  // Load the Grunt plugins.
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Register the default tasks.
  grunt.registerTask('default', ['watch']);
  grunt.loadNpmTasks('grunt-contrib-less');
};
