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
  "frontend:clean-scss", function (cb) {
    del(paths.frontend.scss.dest + "/*", cb);
  }
);

gulp.task(
  "frontend:clean-ts", function (cb) {
    del(paths.frontend.ts.dest + "/*", cb);
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
      .pipe(autoprefixer("last 2 version", "safari 5", "ie 8", "ie 9"))
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
  "frontend:delete-unminified-css", function (cb) {
    del(paths.frontend.scss.dest + "/*.css", cb);
  }
);

gulp.task(
  "frontend:delete-unminified-js", function (cb) {
    del(paths.frontend.ts.dest + "/*.js", cb);
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
  "frontend:delete-temp-minified-css", function (cb) {
    del(paths.frontend.scss.dest + "/*.temp", cb);
  }
);

gulp.task(
  "frontend:delete-temp-minified-js", function (cb) {
    del(paths.frontend.ts.dest + "/*.temp", cb);
  }
);

gulp.task(
  "lib", function (cb) {
    runSequence("lib-clean", "lib-copy", cb);
  }
);

gulp.task(
  "lib-clean", function (cb) {
    del(paths.shared.bower.dest + "/*", cb);
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

gulp.task(
  "copy-extensions", function (cb) {
    gulp.src(["../../artifacts/bin/Platformus.Barebone/Debug/dnxcore50/Platformus.Barebone.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Barebone.Backend/Debug/dnxcore50/Platformus.Barebone.Backend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Barebone.Frontend/Debug/dnxcore50/Platformus.Barebone.Frontend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));

    gulp.src(["../../artifacts/bin/Platformus.Configuration/Debug/dnxcore50/Platformus.Configuration.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Configuration.Backend/Debug/dnxcore50/Platformus.Configuration.Backend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Configuration.Data.Abstractions/Debug/dnxcore50/Platformus.Configuration.Data.Abstractions.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Configuration.Data.EntityFramework.Sqlite/Debug/dnxcore50/Platformus.Configuration.Data.EntityFramework.Sqlite.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    //gulp.src(["../../artifacts/bin/Platformus.Configuration.Data.EntityFramework.SqlServer/Debug/dnxcore50/Platformus.Configuration.Data.EntityFramework.SqlServer.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Configuration.Data.Models/Debug/dnxcore50/Platformus.Configuration.Data.Models.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));

    gulp.src(["../../artifacts/bin/Platformus.Content/Debug/dnxcore50/Platformus.Content.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Content.Backend/Debug/dnxcore50/Platformus.Content.Backend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Content.Data.Abstractions/Debug/dnxcore50/Platformus.Content.Data.Abstractions.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Content.Data.EntityFramework.Sqlite/Debug/dnxcore50/Platformus.Content.Data.EntityFramework.Sqlite.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    //gulp.src(["../../artifacts/bin/Platformus.Content.Data.EntityFramework.SqlServer/Debug/dnxcore50/Platformus.Content.Data.EntityFramework.SqlServer.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Content.Data.Models/Debug/dnxcore50/Platformus.Content.Data.Models.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Content.Frontend/Debug/dnxcore50/Platformus.Content.Frontend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Content.Frontend.User/Debug/dnxcore50/Platformus.Content.Frontend.User.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));

    gulp.src(["../../artifacts/bin/Platformus.Forms/Debug/dnxcore50/Platformus.Forms.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Forms.Backend/Debug/dnxcore50/Platformus.Forms.Backend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Forms.Data.Abstractions/Debug/dnxcore50/Platformus.Forms.Data.Abstractions.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Forms.Data.EntityFramework.Sqlite/Debug/dnxcore50/Platformus.Forms.Data.EntityFramework.Sqlite.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    //gulp.src(["../../artifacts/bin/Platformus.Forms.Data.EntityFramework.SqlServer/Debug/dnxcore50/Platformus.Forms.Data.EntityFramework.SqlServer.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Forms.Data.Models/Debug/dnxcore50/Platformus.Forms.Data.Models.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Forms.Frontend/Debug/dnxcore50/Platformus.Forms.Frontend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));

    gulp.src(["../../artifacts/bin/Platformus.Globalization/Debug/dnxcore50/Platformus.Globalization.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Globalization.Backend/Debug/dnxcore50/Platformus.Globalization.Backend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Globalization.Data.Abstractions/Debug/dnxcore50/Platformus.Globalization.Data.Abstractions.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Globalization.Data.EntityFramework.Sqlite/Debug/dnxcore50/Platformus.Globalization.Data.EntityFramework.Sqlite.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    //gulp.src(["../../artifacts/bin/Platformus.Globalization.Data.EntityFramework.SqlServer/Debug/dnxcore50/Platformus.Globalization.Data.EntityFramework.SqlServer.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Globalization.Data.Models/Debug/dnxcore50/Platformus.Globalization.Data.Models.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Globalization.Frontend/Debug/dnxcore50/Platformus.Globalization.Frontend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));

    gulp.src(["../../artifacts/bin/Platformus.Navigation/Debug/dnxcore50/Platformus.Navigation.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Navigation.Backend/Debug/dnxcore50/Platformus.Navigation.Backend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Navigation.Data.Abstractions/Debug/dnxcore50/Platformus.Navigation.Data.Abstractions.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Navigation.Data.EntityFramework.Sqlite/Debug/dnxcore50/Platformus.Navigation.Data.EntityFramework.Sqlite.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    //gulp.src(["../../artifacts/bin/Platformus.Navigation.Data.EntityFramework.SqlServer/Debug/dnxcore50/Platformus.Navigation.Data.EntityFramework.SqlServer.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Navigation.Data.Models/Debug/dnxcore50/Platformus.Navigation.Data.Models.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Navigation.Frontend/Debug/dnxcore50/Platformus.Navigation.Frontend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));

    gulp.src(["../../artifacts/bin/Platformus.Security/Debug/dnxcore50/Platformus.Security.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Security.Backend/Debug/dnxcore50/Platformus.Security.Backend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Security.Data.Abstractions/Debug/dnxcore50/Platformus.Security.Data.Abstractions.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Security.Data.EntityFramework.Sqlite/Debug/dnxcore50/Platformus.Security.Data.EntityFramework.Sqlite.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    //gulp.src(["../../artifacts/bin/Platformus.Security.Data.EntityFramework.SqlServer/Debug/dnxcore50/Platformus.Security.Data.EntityFramework.SqlServer.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Security.Data.Models/Debug/dnxcore50/Platformus.Security.Data.Models.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));

    gulp.src(["../../artifacts/bin/Platformus.Static/Debug/dnxcore50/Platformus.Static.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Static.Backend/Debug/dnxcore50/Platformus.Static.Backend.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Static.Data.Abstractions/Debug/dnxcore50/Platformus.Static.Data.Abstractions.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Static.Data.EntityFramework.Sqlite/Debug/dnxcore50/Platformus.Static.Data.EntityFramework.Sqlite.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    //gulp.src(["../../artifacts/bin/Platformus.Static.Data.EntityFramework.SqlServer/Debug/dnxcore50/Platformus.Static.Data.EntityFramework.SqlServer.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Static.Data.Models/Debug/dnxcore50/Platformus.Static.Data.Models.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));

    gulp.src(["../../artifacts/bin/Platformus.Data/Debug/dnxcore50/Platformus.Data.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Data.Abstractions/Debug/dnxcore50/Platformus.Data.Abstractions.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Data.EntityFramework.Sqlite/Debug/dnxcore50/Platformus.Data.EntityFramework.Sqlite.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    //gulp.src(["../../artifacts/bin/Platformus.Data.EntityFramework.SqlServer/Debug/dnxcore50/Platformus.Data.EntityFramework.SqlServer.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));
    gulp.src(["../../artifacts/bin/Platformus.Data.Models.Abstractions/Debug/dnxcore50/Platformus.Data.Models.Abstractions.dll"]).pipe(gulp.dest("../../artifacts/bin/Extensions"));

    cb();
  }
);