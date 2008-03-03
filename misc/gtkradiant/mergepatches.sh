#!/bin/sh

# script that generates the combined patch from the source patches

# if this is run as CGI, add a header
if [ -n "$REQUEST_METHOD" ]; then
	echo "Content-type: text/plain"
	echo ""
fi

cat <<'EOF'
NOTE: this patch set is autogenerated from the "singlepatches" subdirectory of nexuiz/trunk/misc.

Do not commit changes to THIS!

Always run
	sh mergepatches.sh > gtkradiant-nexuiz-patchset.diff
before committing new singlepatches!



EOF

cd singlepatches

pq=
pr=
for X in [!_]*.diff; do
	cat "$X"
	Y=${X%.diff}
	Z=${Y%%-*}
	Y=${Y#*-}
	[ "$Z" = "q3map2" ] || pr="$pr-$Y"
	[ "$Z" = "gtkradiant" ] || pq="$pq-$Y"
done

cat <<EOF
Index: tools/quake3/q3map2/q3map2.h
===================================================================
--- tools/quake3/q3map2/q3map2.h	(revision 193)
+++ tools/quake3/q3map2/q3map2.h	(working copy)
@@ -35,8 +35,8 @@
 
 
 /* version */
-#define Q3MAP_VERSION	"2.5.17"
-#define Q3MAP_MOTD		"Last one turns the lights off"
+#define Q3MAP_VERSION	"2.5.17-div0$pq"
+#define Q3MAP_MOTD		"Blackhole Box ate all the light"
 
 
 
Index: include/version.default
===================================================================
--- include/version.default     (revision 193)
+++ include/version.default     (working copy)
@@ -1 +1 @@
-1.5.0
+1.5.0-div0$pr
EOF
