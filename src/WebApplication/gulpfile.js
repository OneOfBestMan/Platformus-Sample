var gulp = require("gulp"),
  autoprefixer = require("gulp-autoprefixer"),
  concat = require("gulp-concat"),
  del = require("del"),
  minifyCss = require("gulp-minify-css"),
  rename = require("gulp-rename"),
  runSequence = require("run-sequence"),
  sass = require("gulp-sass"),
  tsc = require("gulp-tsc"),
  uglify = require("gulp-uglify");

var paths = {
  frontend: {
    scss: {
      src: [
        "styles/*.scss"
      ],
      dest: "wwwroot/css"
    },
    ts: {
      src: [
        "scripts/*.ts"
      ],
      dest: "wwwroot/js"
    }
  },
  shared: {
    bower: {
      src: "bower_components",
      dest: "wwwroot/lib"
    }
  }
}

gulp.task(
  "rebuild",
  function (cb) {
    runSequence(
      "clean",
      "build",
      "minify",
      "delete-unminified",
      "rename-temp-minified",
      "delete-temp-minified",
      cb
    );
  }
);

gulp.task(
  "clean", function (cb) {
    runSequence(["frontend:clean-scss", "frontend:clean-ts"], cb);
  }
);

gulp.task(
  "frontend:clean-scss", function () {
    return del(paths.frontend.scss.dest + "/*");
  }
);

gulp.task(
  "frontend:clean-ts", function (cb) {
    return del(paths.frontend.ts.dest + "/*");
  }
);

gulp.task(
  "build", function (cb) {
    runSequence("frontend:build-scss", "frontend:build-ts", cb);
  }
);

gulp.task(
  "frontend:build-scss", function (cb) {
    return gulp.src(paths.frontend.scss.src)
      .pipe(sass())
      .pipe(gulp.dest(paths.frontend.scss.dest));
  }
);

gulp.task(
  "frontend:build-ts", function (cb) {
    return gulp.src(paths.frontend.ts.src)
      .pipe(tsc())
      .pipe(gulp.dest(paths.frontend.ts.dest));
  }
);

gulp.task(
  "minify", function (cb) {
    runSequence("frontend:minify-css", "frontend:minify-js", cb);
  }
);

gulp.task(
  "frontend:minify-css", function (cb) {
    return gulp.src(paths.frontend.scss.dest + "/*.css")
      .pipe(minifyCss())
      .pipe(autoprefixer())
      .pipe(concat("webapplication.min.css.temp"))
      .pipe(gulp.dest(paths.frontend.scss.dest));
  }
);

gulp.task(
  "frontend:minify-js", function (cb) {
    return gulp.src(paths.frontend.ts.dest + "/*.js")
      .pipe(uglify())
      .pipe(concat("webapplication.min.js.temp"))
      .pipe(gulp.dest(paths.frontend.ts.dest));
  }
);

gulp.task(
  "delete-unminified", function (cb) {
    runSequence("frontend:delete-unminified-css", "frontend:delete-unminified-js", cb);
  }
);

gulp.task(
  "frontend:delete-unminified-css", function () {
    return del(paths.frontend.scss.dest + "/*.css");
  }
);

gulp.task(
  "frontend:delete-unminified-js", function () {
    return del(paths.frontend.ts.dest + "/*.js");
  }
);

gulp.task(
  "rename-temp-minified", function (cb) {
    runSequence("frontend:rename-temp-minified-css", "frontend:rename-temp-minified-js", cb);
  }
);

gulp.task(
  "frontend:rename-temp-minified-css", function (cb) {
    return gulp.src(paths.frontend.scss.dest + "/webapplication.min.css.temp")
      .pipe(rename("webapplication.min.css"))
      .pipe(gulp.dest(paths.frontend.scss.dest));
  }
);

gulp.task(
  "frontend:rename-temp-minified-js", function (cb) {
    return gulp.src(paths.frontend.ts.dest + "/webapplication.min.js.temp")
      .pipe(rename("webapplication.min.js"))
      .pipe(gulp.dest(paths.frontend.ts.dest));
  }
);

gulp.task(
  "delete-temp-minified", function (cb) {
    runSequence("frontend:delete-temp-minified-css", "frontend:delete-temp-minified-js", cb);
  }
);

gulp.task(
  "frontend:delete-temp-minified-css", function () {
    return del(paths.frontend.scss.dest + "/*.temp");
  }
);

gulp.task(
  "frontend:delete-temp-minified-js", function () {
    return del(paths.frontend.ts.dest + "/*.temp");
  }
);

gulp.task(
  "lib", function (cb) {
    runSequence("lib-clean", "lib-copy", cb);
  }
);

gulp.task(
  "lib-clean", function () {
    return del(paths.shared.bower.dest + "/*");
  }
);

gulp.task(
  "lib-copy", function (cb) {
    var lib = {
      "/jquery": "/jquery/dist/jquery*.{js,map}",
      "/jquery-validation": "/jquery-validation/dist/jquery.validate*.js",
      "/jquery-validation-unobtrusive": "/jquery-validation-unobtrusive/jquery.validate.unobtrusive*.js",
      "/tinymce": "/tinymce/*.js"
    };

    for (var $package in lib) {
      gulp
        .src(paths.shared.bower.src + lib[$package])
        .pipe(gulp.dest(paths.shared.bower.dest + $package));
    }

    gulp.src([paths.shared.bower.src + "/tinymce/plugins/**/*"]).pipe(gulp.dest(paths.shared.bower.dest + "/tinymce/plugins"));
    gulp.src([paths.shared.bower.src + "/tinymce/skins/**/*"]).pipe(gulp.dest(paths.shared.bower.dest + "/tinymce/skins"));
    gulp.src([paths.shared.bower.src + "/tinymce/themes/**/*"]).pipe(gulp.dest(paths.shared.bower.dest + "/tinymce/themes"));
    cb();
  }
);